# Important Notice

**Chapters "02_first_ax_project" and "introduction_to_st" are now available in a separate repository!**

- **Repository:** [simatic-ax/axlp_apax_and_project_creation](https://github.com/simatic-ax/axlp_apax_and_project_creation)
- **Presentation:** [GitHub Pages (Online & Direct)](https://simatic-ax.github.io/axlp_apax_and_project_creation/)

---

# Wichtiger Hinweis

**Die Kapitel "first_ax_project" und "introduction_to_st" sind über ein separates Repository und einen eigenen Link erreichbar!**

- **Repository:** [simatic-ax/axlp_apax_and_project_creation](https://github.com/simatic-ax/axlp_apax_and_project_creation)
- **Präsentation:** [GitHub Pages (Direkt & Online)](https://simatic-ax.github.io/axlp_apax_and_project_creation/)

---
## How to get the learning path

To retrieve the learning path, you can either

### Clone the directory using git with the command 
```
git clone https://github.com/simatic-ax/learning-path
```
This will create a new directory in the folder you executed the git clone from.

### Download the repository as an archive
Click on `Code` in the gitlab repository overview and select one of the archive formats to download the entire repository. You then have to decompress the downloaded archive file with a tool like 7zip and are ready to go!

![Download archive](./assets/img/download_archive.png)

> **Note:** The chapter `02_first_ax_project` has moved to a separate repository. You can access the repository and the presentation via the following links:
> - [Repository: simatic-ax/axlp_apax_and_project_creation](https://github.com/simatic-ax/axlp_apax_and_project_creation)
> - [Presentation: GitHub Pages](https://simatic-ax.github.io/axlp_apax_and_project_creation/#/)

## Prerequisites:
For the interactive slides, you need to have a few software packages installed to your PC:
- nodejs (which also installs npm) [here you can download the installer for node.js for Windows](https://nodejs.org/en)
- Reveal.md (how to install it, is described below)

You can install Reveal.md using the command in a terminal


```
npm install --global reveal-md
```

Please note that this will install 3rd party executable files to your PC.

## Starting the slides
For starting the slides, please navigate into the respective directory in the command line
```cd ./00_introduction``` and execute the command 

```
apax present
```

This will start reveal-md with the slides of the section you navigated to.

## Direct Link
[Introduction](./00_introduction/slides/slides.md)

## How to report issues, ideas and suggestions
This learning path is supposed to be a living document and be adjusted to your needs, the needs of your customers and the development of AX itself.

To improve the slides we are in need of feedback from you, as everything with AX it is a community effort! To provide the feedback, please add an issue where you describe, what you want us to change or where there is a mistake.
![New issue](./assets/img/new_issue.png)
Of course you can always do it yourself and send us a merge request!

In case of questions or further discussions, feel free to get in contact with one of our [CODEOWNERS](./CODEOWNERS)
