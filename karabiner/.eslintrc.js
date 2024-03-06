/**
 * @type {import("@types/eslint").Linter.BaseConfig}
 */
module.exports = {
	extends: ["plugin:@typescript-eslint/recommended"],
	parser: "@typescript-eslint/parser",
	plugins: ["@typescript-eslint"],
	root: true,
	rules: {
		// @ts-ignore can be used with a description.
		"@typescript-eslint/ban-ts-comment": [
			"error",
			{ "ts-ignore": "allow-with-description" },
		],
		"jest/no-deprecated-functions": "off",
	},
};
