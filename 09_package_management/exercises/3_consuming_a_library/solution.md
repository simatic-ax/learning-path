## How to publish a package to a private GitHub repository
---
Before starting this workflow you should finish the exercise ``2-Publishing a library``.
1. Create a new application and open it in AX Code
2. Add your registry to the ``apax.yml`` (replace &lt;accountname&gt; with your account name --> same as in the previous exercise)
   ```
   registries:
    '@<accountname>' : 'https://npm.pkg.github.com
    ```
3. Login to GitHub with ``apax login``
4. Add your pack with ``apax add @<username>/<projectname>`` (use the same GitHub account name and project name as in the previous exercise)
5. Add ``USING <yournamespace>`` (&lt;yournamespace&gt; = namespace defined in library) to the top of a program or class
6. Try instantiating a class and calling a function of your library