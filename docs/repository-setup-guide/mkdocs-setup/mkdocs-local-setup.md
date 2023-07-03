# Local Setup of MkDocs

This documentation provides instructions for setting up MkDocs locally on your system.

## Prerequisites

Before you proceed with the installation, make sure you have the following prerequisites:

1. Python (already installed on most systems)
2. Terminal or Command Prompt


## Installation Steps

Follow the steps below to set up MkDocs locally:

1. Open the Terminal or Command Prompt.

2. Install Python using Homebrew (for macOS users):

```
brew install python
```

3. Verify the installation by checking the Python and pip versions:

```
python3 --version
pip3 --version
```

4. Restart the Terminal or Command Prompt.

5. Install MkDocs using pip:

```
pip3 install mkdocs
Restart the Terminal or Command Prompt.
```

6. Create a sample `mkdocs.yml` file and a docs folder in your project directory. You can create the `mkdocs.yml` file by running the following command:

```
touch mkdocs.yml
```

7. Copy the content of mkdocs.yml from the file present at the root of this code repository.

8. Install the following plugins locally using pip:

```
pip3 install mkdocs-material
pip3 install mkdocs-awesome-pages-plugin
pip3 install mkdocs_include_markdown_plugin
pip3 install mkdocs-mermaid2-plugin
pip3 install mkdocs-literate-nav
```


## Running MkDocs
To run MkDocs and preview your documentation locally, use the following command in the Terminal or Command Prompt:

```
mkdocs serve
```

This will start a local development server, and you can access your documentation by opening a web browser and navigating to http://localhost:8000.

You have now successfully set up MkDocs locally on your system. You can start editing your Markdown files in the docs folder and customize the configuration in the mkdocs.yml file as needed.