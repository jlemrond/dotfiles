import fs from "fs";
import { KarabinerRules } from "./types";
import {
	createSuperSubLayers,
	app,
	remap,
	open,
	appleScriptOpen,
} from "./utils";

const superKey = ["left_command", "left_control", "left_shift"];

const rules: KarabinerRules[] = [
	// Define the Super key itself
	{
		description: "Super Key (⌃⇧⌘)",
		manipulators: [
			{
				description: "Right Cmd -> Super Key",
				from: {
					key_code: "right_command",
				},
				to: [
					{
						key_code: "left_shift",
						modifiers: ["left_command", "left_control"],
					},
				],
				type: "basic",
			},
		],
	},
	// {
	// 	description: "Super Key (⌃⇧⌘)",
	// 	manipulators: [
	// 		{
	// 			description: "Right Cmd -> Super Key",
	// 			from: {
	// 				key_code: "right_shift",
	// 			},
	// 			to: [
	// 				{
	// 					key_code: "left_shift",
	// 					modifiers: ["left_command", "left_control"],
	// 				},
	// 			],
	// 			type: "basic",
	// 		},
	// 	],
	// },
	{
		description: "Ctrl + Left Click to Left Click",
		manipulators: [
			{
				from: {
					modifiers: {
						mandatory: ["left_control"],
						optional: ["caps_lock"],
					},
					pointing_button: "button1",
				},
				to: [
					{
						pointing_button: "button1",
					},
					{
						key_code: "left_control",
					},
				],
				type: "basic",
			},
		],
	},
	{
		description: "Caps Lock to Ctrl (Escape if alone)",
		manipulators: [
			{
				from: {
					modifiers: {
						optional: [
							"left_command",
							"left_shift",
							"left_control",
							"left_option",
							"right_command",
							"right_shift",
						],
					},
					key_code: "caps_lock",
				},
				to: [
					{
						key_code: "left_control",
						modifiers: [],
					},
				],
				to_if_alone: [
					{
						key_code: "escape",
					},
				],
				type: "basic",
			},
		],
	},
	// {
	// 	description: "Ctrl + D for Scroll Down",
	// 	manipulators: [
	// 		{
	// 			type: "basic",
	// 			from: {
	// 				key_code: "d",
	// 				modifiers: {
	// 					mandatory: ["left_control"],
	// 				},
	// 			},
	// 			to: [
	// 				{
	// 					key_code: "page_down",
	// 				},
	// 			],
	// 			conditions: [
	// 				{
	// 					type: "frontmost_application_if",
	// 					bundle_identifiers: [
	// 						"company.thebrowser.Browser",
	// 						"com.google.Chrome",
	// 					],
	// 				},
	// 			],
	// 		},
	// 	],
	// },
	// {
	// 	description: "Ctrl + U for Scroll Up",
	// 	manipulators: [
	// 		{
	// 			type: "basic",
	// 			from: {
	// 				key_code: "u",
	// 				modifiers: {
	// 					mandatory: ["left_control"],
	// 				},
	// 			},
	// 			to: [
	// 				{
	// 					key_code: "page_up",
	// 				},
	// 			],
	// 			conditions: [
	// 				{
	// 					type: "frontmost_application_if",
	// 					bundle_identifiers: [
	// 						"company.thebrowser.Browser",
	// 						"com.google.Chrome",
	// 					],
	// 				},
	// 			],
	// 		},
	// 	],
	// },
	{
		description: "Ctrl + N for Arrow Down",
		manipulators: [
			{
				type: "basic",
				from: {
					key_code: "n",
					modifiers: {
						mandatory: ["left_control"],
					},
				},
				to: [
					{
						key_code: "down_arrow",
					},
				],
				conditions: [
					{
						type: "frontmost_application_if",
						bundle_identifiers: [
							"company.thebrowser.Browser",
							"com.google.Chrome",
							"org.godotengine.godot",
						],
					},
				],
			},
		],
	},
	{
		description: "Ctrl + P for Arrow Up",
		manipulators: [
			{
				type: "basic",
				from: {
					key_code: "p",
					modifiers: {
						mandatory: ["left_control"],
					},
				},
				to: [
					{
						key_code: "up_arrow",
					},
				],
				conditions: [
					{
						type: "frontmost_application_if",
						bundle_identifiers: [
							"company.thebrowser.Browser",
							"com.google.Chrome",
							"org.godotengine.godot",
						],
					},
				],
			},
		],
	},
	remap("e", ["right_shift"], "open_bracket", null),
	remap("r", ["right_shift"], "close_bracket", null),
	remap("d", ["right_shift"], "open_bracket", ["left_shift"]),
	remap("f", ["right_shift"], "close_bracket", ["left_shift"]),
	// remap("z", ["right_shift"], "comma", ["left_shift"]),
	// remap("x", ["right_shift"], "period", ["left_shift"]),
	remap("c", ["right_shift"], "9", ["left_shift"]),
	remap("v", ["right_shift"], "0", ["left_shift"]),
	// remap("s", ["right_shift"], "equal_sign", null),
	// remap("g", ["right_shift"], "4", ["left_shift"]),
	// remap("h", ["right_shift"], "6", ["left_shift"]),
	// remap("a", ["right_shift"], "grave_accent_and_tilde", null),
	// remap("p", ["right_shift"], "equal_sign", ["left_shift"]),
	...createSuperSubLayers({
		// a = applications
		a: {
			e: app("Arc"),
			c: app("iTerm"),
			f: app("Figma"),
			g: app("Godot_mono"),
			v: app("Zed"),
			p: app("Postman"),
			d: app("Discord"),
			s: app("Slack"),
			u: app("World of Warcraft Classic"),
			n: app("Notion"),
			t: app("iTerm"),
			b: app("Google Chrome"),
			i: app("Messages"),
			w: app("Dynobase"),
			m: app("Mail"),
			q: app("Beekeeper Studio Ultimate"),
			x: app("Microsoft Excel"),
			semicolon: app("Finder"),
			// Open todo list managed via *H*ypersonic
			// h: open(
			// 	"notion://notion.so/stellatehq/Max-Stoiber-CEO-90ea5326add5408f967278461f37c39b#29b31b030a5a4192b05f3883f7d47fe3"
			// ),
			// z: app("zoom.us"),
			// m: app("Mochi"),
			// f: app("Figma"),
			// r: app("Telegram"),
			// p: app("Spotify"),
			// a: app("iA Presenter"),
			// w: open("https://web.whatsapp.com"),
			// l: open(
			// 	"raycast://extensions/stellate/mxstbr-commands/open-mxs-is-shortlink"
			// ),
		},
		g: {
			p: open("raycast://extensions/raycast/github/search-pull-requests"),
			k: open("raycast://extensions/raycast/github/search-repositories"),
		},

		// w = "Window" via rectangle.app
		// w: {
		// 	semicolon: {
		// 		description: "Window: Hide",
		// 		to: [
		// 			{
		// 				key_code: "h",
		// 				modifiers: ["right_command"],
		// 			},
		// 		],
		// 	},
		// 	y: {
		// 		description: "Window: First Third",
		// 		to: [
		// 			{
		// 				key_code: "left_arrow",
		// 				modifiers: ["right_option", "right_control"],
		// 			},
		// 		],
		// 	},
		// 	k: {
		// 		description: "Window: Top Half",
		// 		to: [
		// 			{
		// 				key_code: "up_arrow",
		// 				modifiers: ["right_option", "right_command"],
		// 			},
		// 		],
		// 	},
		// 	j: {
		// 		description: "Window: Bottom Half",
		// 		to: [
		// 			{
		// 				key_code: "down_arrow",
		// 				modifiers: ["right_option", "right_command"],
		// 			},
		// 		],
		// 	},
		// 	o: {
		// 		description: "Window: Last Third",
		// 		to: [
		// 			{
		// 				key_code: "right_arrow",
		// 				modifiers: ["right_option", "right_control"],
		// 			},
		// 		],
		// 	},
		// 	h: {
		// 		description: "Window: Left Half",
		// 		to: [
		// 			{
		// 				key_code: "left_arrow",
		// 				modifiers: ["right_option", "right_command"],
		// 			},
		// 		],
		// 	},
		// 	l: {
		// 		description: "Window: Right Half",
		// 		to: [
		// 			{
		// 				key_code: "right_arrow",
		// 				modifiers: ["right_option", "right_command"],
		// 			},
		// 		],
		// 	},
		// 	f: {
		// 		description: "Window: Full Screen",
		// 		to: [
		// 			{
		// 				key_code: "f",
		// 				modifiers: ["right_option", "right_command"],
		// 			},
		// 		],
		// 	},
		// 	u: {
		// 		description: "Window: Previous Tab",
		// 		to: [
		// 			{
		// 				key_code: "tab",
		// 				modifiers: ["right_control", "right_shift"],
		// 			},
		// 		],
		// 	},
		// 	i: {
		// 		description: "Window: Next Tab",
		// 		to: [
		// 			{
		// 				key_code: "tab",
		// 				modifiers: ["right_control"],
		// 			},
		// 		],
		// 	},
		// 	n: {
		// 		description: "Window: Next Window",
		// 		to: [
		// 			{
		// 				key_code: "grave_accent_and_tilde",
		// 				modifiers: ["right_command"],
		// 			},
		// 		],
		// 	},
		// 	b: {
		// 		description: "Window: Back",
		// 		to: [
		// 			{
		// 				key_code: "open_bracket",
		// 				modifiers: ["right_command"],
		// 			},
		// 		],
		// 	},
		// 	// Note: No literal connection. Both f and n are already taken.
		// 	m: {
		// 		description: "Window: Forward",
		// 		to: [
		// 			{
		// 				key_code: "close_bracket",
		// 				modifiers: ["right_command"],
		// 			},
		// 		],
		// 	},
		// 	d: {
		// 		description: "Window: Next display",
		// 		to: [
		// 			{
		// 				key_code: "right_arrow",
		// 				modifiers: [
		// 					"right_control",
		// 					"right_option",
		// 					"right_command",
		// 				],
		// 			},
		// 		],
		// 	},
		// },

		// s = "System"
		s: {
			u: {
				to: [
					{
						key_code: "volume_increment",
					},
				],
			},
			j: {
				to: [
					{
						key_code: "volume_decrement",
					},
				],
			},
			i: {
				to: [
					{
						key_code: "display_brightness_increment",
					},
				],
			},
			k: {
				to: [
					{
						key_code: "display_brightness_decrement",
					},
				],
			},
			l: {
				to: [
					{
						key_code: "q",
						modifiers: ["right_control", "right_command"],
					},
				],
			},
			p: {
				to: [
					{
						key_code: "play_or_pause",
					},
				],
			},
			semicolon: {
				to: [
					{
						key_code: "fastforward",
					},
				],
			},
			e: {
				to: [
					{
						// Emoji picker
						key_code: "spacebar",
						modifiers: ["right_control", "right_command"],
					},
				],
			},
			// Turn on Elgato KeyLight
			// y: {
			// 	to: [
			// 		{
			// 			shell_command: `curl -H 'Content-Type: application/json' --request PUT --data '{ "numberOfLights": 1, "lights": [ { "on": 1, "brightness": 100, "temperature": 215 } ] }' http://192.168.8.84:9123/elgato/lights`,
			// 		},
			// 	],
			// },
			// h: {
			// 	to: [
			// 		{
			// 			shell_command: `curl -H 'Content-Type: application/json' --request PUT --data '{ "numberOfLights": 1, "lights": [ { "on": 0, "brightness": 100, "temperature": 215 } ] }' http://192.168.8.84:9123/elgato/lights`,
			// 		},
			// 	],
			// },
		},

		// v = "moVe" which isn't "m" because we want it to be on the left hand
		// so that hjkl work like they do in vim
		// v: {
		// 	h: {
		// 		to: [{ key_code: "left_arrow" }],
		// 	},
		// 	j: {
		// 		to: [{ key_code: "down_arrow" }],
		// 	},
		// 	k: {
		// 		to: [{ key_code: "up_arrow" }],
		// 	},
		// 	l: {
		// 		to: [{ key_code: "right_arrow" }],
		// 	},
		// 	// Magicmove via homerow.app
		// 	m: {
		// 		to: [{ key_code: "f", modifiers: ["right_control"] }],
		// 	},
		// 	// Scroll mode via homerow.app
		// 	s: {
		// 		to: [{ key_code: "j", modifiers: ["right_control"] }],
		// 	},
		// 	d: {
		// 		to: [
		// 			{
		// 				key_code: "d",
		// 				modifiers: ["right_shift", "right_command"],
		// 			},
		// 		],
		// 	},
		// 	u: {
		// 		to: [{ key_code: "page_down" }],
		// 	},
		// 	i: {
		// 		to: [{ key_code: "page_up" }],
		// 	},
		// },

		// c = Musi*c* which isn't "m" because we want it to be on the left hand
		// c: {
		// 	p: {
		// 		to: [{ key_code: "play_or_pause" }],
		// 	},
		// 	n: {
		// 		to: [{ key_code: "fastforward" }],
		// 	},
		// 	b: {
		// 		to: [{ key_code: "rewind" }],
		// 	},
		// },

		// r = "Raycast"
		// r: {
		// 	l: open(
		// 		"raycast://extensions/stellate/mxstbr-commands/create-mxs-is-shortlink"
		// 	),
		// 	e: open("raycast://extensions/raycast/emoji/search-emoji"),
		// 	c: open("raycast://extensions/raycast/raycast/confetti"),
		// 	a: open("raycast://extensions/raycast/raycast-ai/ai-chat"),
		// 	s: open("raycast://extensions/peduarte/silent-mention/index"),
		// 	h: open(
		// 		"raycast://extensions/raycast/clipboard-history/clipboard-history"
		// 	),
		// 	1: open(
		// 		"raycast://extensions/VladCuciureanu/toothpick/connect-favorite-device-1"
		// 	),
		// 	2: open(
		// 		"raycast://extensions/VladCuciureanu/toothpick/connect-favorite-device-2"
		// 	),
		// },
	}),
];

fs.writeFileSync(
	"karabiner.json",
	JSON.stringify(
		{
			global: {
				ask_for_confirmation_before_quitting: true,
				check_for_updates_on_startup: true,
				show_in_menu_bar: true,
				show_profile_name_in_menu_bar: false,
				unsafe_ui: false,
			},
			profiles: [
				{
					name: "Default",
					complex_modifications: {
						parameters: {
							"basic.simultaneous_threshold_milliseconds": 50,
							"basic.to_delayed_action_delay_milliseconds": 500,
							"basic.to_if_alone_timeout_milliseconds": 1000,
							"basic.to_if_held_down_threshold_milliseconds": 500,
							"mouse_motion_to_scroll.speed": 100,
						},
						rules,
					},
				},
			],
		},
		null,
		4
	)
);
