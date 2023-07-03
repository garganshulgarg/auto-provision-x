# Local Setup of Husky

## Prerequisite

Before setting up Husky, ensure that your `npm` version is greater than `7.0.0`. You can check your npm version by running the command `npm -v` in your terminal or command prompt.

## Installing Husky

To install Husky and set up the local configuration, follow these steps:

1. Open your terminal or command prompt.

2. Navigate to your project's root directory.

3. Run the following command to install Husky:

```
npx husky-init && npm install
```

4. This command will initialize Husky in your project and install the necessary dependencies.

5. For more detailed information and troubleshooting, you can refer to the [official Husky documentation](https://typicode.github.io/husky/getting-started.html).

## Configuring Commitlint

Commitlint can be configured to enforce the conventional commit format and validate commit messages. Follow these steps to set up Commitlint:

1. Open your terminal or command prompt.

2. Navigate to your project's root directory.

3. Run the following command to install Commitlint and Husky as dev dependencies:

```
npm install --save-dev @commitlint/cli husky
```

4. Create a file named `commitlint.config.js` in your project's root directory.

5. Open the `commitlint.config.js` file in a text editor.

6. Add the following configuration to enable the conventional commit format:

```
module.exports = {
  extends: ['@commitlint/config-conventional'],
};
```

7. Save the changes to the `commitlint.config.js` file.

## Testing the Configuration

To ensure that the Commitlint and Husky configuration is working correctly, follow these steps:

1. Create a new commit or amend an existing commit in your repository.

2. Before the commit is finalized, Commitlint will enforce the conventional commit format and validate the commit message.

3. If the commit message does not adhere to the specified format, Commitlint will throw an error and prevent the commit from being made.


By following these steps, you can set up Husky locally, configure Commitlint to enforce conventional commit messages, and validate commit messages before finalizing the commit. This helps maintain consistent commit message formats and improves the overall quality of commits in your project.