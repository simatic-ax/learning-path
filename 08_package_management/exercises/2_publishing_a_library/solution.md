## How to publish a package to a private GitHub repository
---
For the following workflow you will need a GitHub account. This is just an example on how to publish a package. Other services like GitLab can be used aswell, but won´t be explained in this chapter.

1. Add your registry to the ``apax.yml`` (replace &lt;accountname&gt; with your account name which is shown on the top left on the GitHub Dashboard)
   ```
   registries:
    '@<accountname>' : 'https://npm.pkg.github.com
    ```
2. Add the same account name in front of the ``name`` in the ``apax.yml``:
    ```
    name: "@<accountname>/exampleprojectname"
    ```
3. Run ``apax pack``
4. Login to GitHub using ``apax login`` --> choose GitHub in the menu --> leave the user name empty and press enter --> enter your token when asked for the password (a tutorial on how to create a personal access token can be found here: https://github.com/simatic-ax/.github/blob/main/docs/personalaccesstoken.md)
5. Run ``apax publish --package <packagename>.apax.tgz --registry https://npm.pkg.github.com`` (replace &lt;packagename&gt; with the name of the package which was created during ``apax pack``; it can be found in the explorer of your project e. g. accountname-projectname-1.0.1.apax.tgz)
6. Go to ``GitHub`` --> click your profile picture in the top right --> click on ``Your repositories`` --> click on ``Packages`` on the top left
7. You should see your published package
8. If you publish multiple versions you will see all published versions after clicking on the package