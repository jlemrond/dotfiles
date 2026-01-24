import {
	To,
	KeyCode,
	Manipulator,
	KarabinerRules,
	From,
	Modifiers,
} from "./types";

/**
 * Custom way to describe a command in a layer
 */
export interface LayerCommand {
	to: To[];
	description?: string;
}

type SuperKeySublayer = {
	// The ? is necessary, otherwise we'd have to define something for _every_ key code
	[key_code in KeyCode]?: LayerCommand;
};

/**
 * Create a Super Key sublayer, where every command is prefixed with a key
 * e.g. Super + O ("Open") is the "open applications" layer, I can press
 * e.g. Super + O + G ("Google Chrome") to open Chrome
 */
export function createSuperSubLayer(
	sublayer_key: KeyCode,
	commands: SuperKeySublayer,
	allSubLayerVariables: string[]
): Manipulator[] {
	const subLayerVariableName = generateSubLayerVariableName(sublayer_key);

	return [
		// When Super + sublayer_key is pressed, set the variable to 1; on key_up, set it to 0 again
		{
			description: `Toggle Super sublayer ${sublayer_key}`,
			type: "basic",
			from: {
				key_code: sublayer_key,
				modifiers: {
					mandatory: ["left_command", "left_control", "left_shift"],
				},
			},
			to_after_key_up: [
				{
					set_variable: {
						name: subLayerVariableName,
						// The default value of a variable is 0: https://karabiner-elements.pqrs.org/docs/json/complex-modifications-manipulator-definition/conditions/variable/
						// That means by using 0 and 1 we can filter for "0" in the conditions below and it'll work on startup
						value: 0,
					},
				},
			],
			to: [
				{
					set_variable: {
						name: subLayerVariableName,
						value: 1,
					},
				},
			],
			// This enables us to press other sublayer keys in the current sublayer
			// (e.g. Super + O > M even though Super + M is also a sublayer)
			// basically, only trigger a sublayer if no other sublayer is active
			conditions: allSubLayerVariables
				.filter(
					(subLayerVariable) =>
						subLayerVariable !== subLayerVariableName
				)
				.map((subLayerVariable) => ({
					type: "variable_if",
					name: subLayerVariable,
					value: 0,
				})),
		},
		// Define the individual commands that are meant to trigger in the sublayer
		...(Object.keys(commands) as (keyof typeof commands)[]).map(
			(command_key): Manipulator => ({
				...commands[command_key],
				type: "basic" as const,
				from: {
					key_code: command_key,
					modifiers: {
						// Mandatory modifiers are *not* added to the "to" event
						mandatory: ["any"],
					},
				},
				// Only trigger this command if the variable is 1 (i.e., if Super + sublayer is held)
				conditions: [
					{
						type: "variable_if",
						name: subLayerVariableName,
						value: 1,
					},
				],
			})
		),
	];
}

/**
 * Create all super sublayers. This needs to be a single function, as well need to
 * have all the super variable names in order to filter them and make sure only one
 * activates at a time
 */
export function createSuperSubLayers(subLayers: {
	[key_code in KeyCode]?: SuperKeySublayer | LayerCommand;
}): KarabinerRules[] {
	const allSubLayerVariables = (
		Object.keys(subLayers) as (keyof typeof subLayers)[]
	).map((sublayer_key) => generateSubLayerVariableName(sublayer_key));

	return Object.entries(subLayers).map(([key, value]) =>
		"to" in value
			? {
					description: `Super Key + ${key}`,
					manipulators: [
						{
							...value,
							type: "basic" as const,
							from: {
								key_code: key as KeyCode,
								modifiers: {
									// Mandatory modifiers are *not* added to the "to" event
									mandatory: [
										"left_command",
										"left_control",
										"left_shift",
									],
								},
							},
						},
					],
			  }
			: {
					description: `Super Key sublayer "${key}"`,
					manipulators: createSuperSubLayer(
						key as KeyCode,
						value,
						allSubLayerVariables
					),
			  }
	);
}

function generateSubLayerVariableName(key: KeyCode) {
	return `super_sublayer_${key}`;
}

/**
 * Shortcut for "open" shell command
 */
export function open(what: string): LayerCommand {
	return {
		to: [
			{
				shell_command: `open ${what}`,
			},
		],
		description: `Open ${what}`,
	};
}

/**
 * Open via AppleScript "activate" command, which will open the app if not open,
 */
export function appleScriptOpen(what: string): LayerCommand {
	return {
		to: [
			{
				shell_command: `osascript -e 'tell application "${what}" to activate'`,
			},
		],
		description: `Open ${what}`,
	};
}

/**
 * Shortcut for "Open an app" command (of which there are a bunch)
 */
export function app(name: string): LayerCommand {
	return open(`-a '${name}.app'`);
}

/**
 * Remap a key to a different key
 */
export function remap(
	from: KeyCode,
	fromMod: Modifiers["mandatory"] | null,
	to: KeyCode,
	toMod: Modifiers["mandatory"] | null
): KarabinerRules {
	// {
	// 	description: "RightShift + f is <",
	// 		manipulators: [
	// 			{
	// 				type: "basic",
	// 				from: {
	// 					key_code: "f",
	// 					modifiers: {
	// 						mandatory: ["right_shift"],
	// 					},
	// 				},
	// 				to: [
	// 					{
	// 						key_code: "comma",
	// 						modifiers: ["left_shift"],
	// 					},
	// 				],
	// 			},
	// 		],
	// },

	const fromDescription = fromMod ? `${fromMod.join(" + ")} + ${from}` : from;
	const toDescription = toMod ? `${toMod.join(" + ")} + ${to}` : to;

	const description = `Remap ${fromDescription} to ${toDescription}`;

	const fromInput: From = {
		key_code: from,
	};

	if (fromMod) {
		fromInput.modifiers = {
			mandatory: fromMod,
		};
	}

	const toInput: To = {
		key_code: to,
	};

	if (toMod) {
		toInput.modifiers = toMod;
	}

	return {
		description,
		manipulators: [
			{
				type: "basic",
				from: fromInput,
				to: [toInput],
			},
		],
	};
}
