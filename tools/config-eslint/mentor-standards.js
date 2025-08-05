module.exports = {
  extends: [
    "next/core-web-vitals",
    "plugin:jsx-a11y/recommended",
    "@typescript-eslint/recommended",
  ],
  plugins: ["jsx-a11y", "@typescript-eslint"],
  rules: {
    // Règles pour forcer nos standards
    "jsx-a11y/aria-props": "error",
    "jsx-a11y/aria-proptypes": "error",
    "jsx-a11y/aria-unsupported-elements": "error",
    "jsx-a11y/role-has-required-aria-props": "error",
    "jsx-a11y/role-supports-aria-props": "error",
    "jsx-a11y/tabindex-no-positive": "error",
    "jsx-a11y/alt-text": "error",
    "jsx-a11y/anchor-has-content": "error",
    "jsx-a11y/anchor-is-valid": "error",
    "jsx-a11y/click-events-have-key-events": "error",
    "jsx-a11y/no-autofocus": "error",
    "jsx-a11y/no-static-element-interactions": "error",

    // Règles personnalisées pour nos standards
    "custom/require-test-id": "error",
    "custom/require-explicit-id": "error",
    "custom/require-aria-label": "error",

    // Règles TypeScript
    "@typescript-eslint/no-unused-vars": "error",
    "@typescript-eslint/no-explicit-any": "warn",
    "@typescript-eslint/explicit-function-return-type": "off",
    "@typescript-eslint/explicit-module-boundary-types": "off",

    // Règles générales
    "no-console": "warn",
    "no-debugger": "error",
    "prefer-const": "error",
    "no-var": "error",
    "object-shorthand": "error",
    "prefer-template": "error",
  },
  overrides: [
    {
      files: ["**/*.test.ts", "**/*.test.tsx", "**/*.spec.ts", "**/*.spec.tsx"],
      rules: {
        "jsx-a11y/aria-props": "off",
        "jsx-a11y/aria-proptypes": "off",
        "jsx-a11y/aria-unsupported-elements": "off",
        "jsx-a11y/role-has-required-aria-props": "off",
      },
    },
  ],
  settings: {
    "jsx-a11y": {
      components: {
        Button: "button",
        Link: "a",
        Image: "img",
        Input: "input",
        Textarea: "textarea",
        Select: "select",
        Option: "option",
      },
    },
  },
};
