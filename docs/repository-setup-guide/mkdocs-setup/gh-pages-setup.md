# Setting up GitHub Pages for MkDocs



To set up GitHub Pages for MkDocs, you will need to create a GitHub Action that automates the process of pushing your code to the `gh-pages` branch of your repository. The GitHub Action will execute the following command:

```
mkdocs build
mkdocs gh-deploy --force
```

This command will generate all the relevant files and commit the code to the repository.

For more details on the GitHub Action setup, refer to the file `.github/workflows/deploy-docs.yml` within the same repository.