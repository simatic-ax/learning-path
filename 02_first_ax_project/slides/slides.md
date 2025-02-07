---
title: Introduction to the SIMATIC AX Code IDE 
progress: true
revealOptions:
  transition: 'fade'
mouseWheel: true,
---

# Agenda

|  |  |
| -- | ----- |
| 00 | Introduction to the workshop |
| 01 | Introduction to the SIMATIC AX Code IDE |
| **02** | **Get started with your first AX Project** |
| 03 | Loading and Debugging |
| 04 | Introduction to ST Programming |
| 05 | OOP Elements of ST |
| 06 | Unit Testing |
| 07 | Tools for commissioning |
| 08 | Package management |
| 09 | Versioning and Continuous Integration |

---
<header class="slide_header">
  <h2>Prerequisites</h2>
</header>

<div class="grid-two-col-eq">
  <div class="flex-col justify-center">
    <p>To get started, you need to have SIMATIC AX, apax and all its prerequisites installed. To get access to the software you need a SiemensID account and a license for SIMATIC AX.</p>
        <ul>
            <li><a href="https://console.simatic-ax.siemens.io/docs/get-started/prerequisites">Prerequisites for installing SIMATIC AX</a></li>
            <li><a href="https://console.simatic-ax.siemens.io/downloads">Download and install SIMATIC AX</a></li>
        </ul>
    <br>
    <p>Additionally you should be familiar with the basic usage of SIMATIC AX Code.</P>
    </br>
    <p>With this you are set up to continue with this learning path.</p>
  </div>
</div>
---

<header class="slide_header">
  <h2>
        What will you learn in this chapter
  </h2>
</header>

<div class="grid-two-col-eq">
  <div class="flex-col justify-center">
    <p>After you've completed this training section you will </p>
        <ul>
            <li>understand the basics of package management</li>
            <li>know how to use apax to create and build a new project</li>
            <li>have learned about:</li>
            <ul>
                <li>the overall structure of a SIMATIC AX project </li>
                <li>project templates and dependencies</li>
                <li>the project manifest file</li>
                <li>how to build the project</li>
            </ul>
        </ul>
    <br>
  </div>
</div>

----
<header class="slide_header">
  <h2>Prerequisites</h2>
</header>

<div class="grid-two-col-eq">
  <div class="flex-col justify-center">
    <li>to get started, you need to have SIMATIC AX, apax and all its prerequisites installed </li>
    <li>in addition, you should know the basics on how to use AX Code</li>
    <li>basic knowledge of using the command line interface (CLI) is also required This includes:</li>
    <ul>
      <li>how to open a CLI</li>
      <li>how to change directories</li>
      <li>how to execute commands</li>
    </ul>
    <br/>
    <li>with this, you are set up to continue with this learning path</li>
  </div>
</div>
---
<div class="grid-slide-container">
  <div class="grid-slide-header">
  <header class="slide_header">
  <h2>Introduction to package management</h2>
  <h3>Overview</h3>
  </header>
  </div>
  <div class="grid-slide-text">
    <p>To create a new project from a template we first need to understand how to retrieve a template at all.</p>
    <br>
    <p>For this we will use the tool <code>apax</code> that we have installed in the previous step.</p>
    <div class="definition"><code>apax</code> is a command line interface tool that serves as a package manager and facilitator for each step in the development workflow.</div>
    <p>We will learn more about this tool in the upcoming sections.<p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apax_overview.svg); background-repeat: no-repeat">
  </div>
</div>

----

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
    <h2>Introduction to package management</h2>
    <h3>What is Apax?</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <li>apax is the central tool within Simatic AX, acting as a package manager and a build tool</li>
    <li>apax is a command line interface tool that serves as a package manager and facilitator for each step in the development workflow</li>
    <li>it helps you create, build, and manage AX projects efficiently</li>
    <div class="definition"><code>apax</code> automates the process of retrieving and managing project dependencies, making it easier to develop and maintain AX projects.</div>
    <br>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apax_overview.svg); background-repeat: no-repeat">
  </div>
</div>

----
<div class="grid-slide-container">
  <div class="grid-slide-header">
  <header class="slide_header">
    <h2>Introduction to package management</h2>
    <h3>What is a package manager?</h3>
  </header>
  </div>
  <div class="grid-slide-text">
  <li>a package manager is a tool that automates the process of installing, updating, and managing software packages and their dependencies</li>
  <br>
  <li>it retrieves libraries and tools (packages) required for your project from central databases (registries) and downloads them to your PC</li>
  <div class="definition">a package manager simplifies the process of managing software dependencies and ensures that your project has all the necessary components to run correctly.</div>
  <p>common examples of package managers include npm for JavaScript, pip for Python, and apax for AX projects.</p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apax_overview.svg); background-repeat: no-repeat; background-size: contain">
  </div>
</div>

----
<div class="grid-slide-container">
  <div class="grid-slide-header">
    <header class="slide_header">
      <h2>Introduction to package management</h2>
      <h3>Configuration file for package manager</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>Typically a package manager requires a configuration file named. This file contains many entries that define:</p>
    <ul>
        <li>the command line/ terminal</li>
        <li>via an extension</li>
        <li>the SIMATIC AX Code command palette</li>
    </ul>
    <p>In the case of <strong>Apax</strong> the name of the configuration file is <code>apax.yml</code></p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apax_yml.svg); background-repeat: no-repeat; background-size: contain">
  </div>
</div>
----

<div class="grid-slide-container">
  <div class="grid-slide-header">
  <header class="slide_header">
    <h2>Introduction to package management</h2>
    <h3>What is a package?</h3>
  </header>
  </div>
  <div class="grid-slide-text">
  <p>A package is a bundle of code that provides specific functionality and can be easily shared and reused. It typically includes tools, compiled code, or source code. Examples of packages are:</p>
  <ul>
    <li>tools like the ST compiler (STC) or SIMATIC loader (SLD)</li>
    <li>system libraries like IEC Timer or Motion Control</li>
    <li>user libraries that come from GitHub or are self-created</li>
  </ul>
  <p>Packages can be individually updated, which significantly simplifies the process of updating a library.</p>
  <p>The full package name then becomes something like <code>@ax/package-name</code>, helping in organizing and managing packages, especially when dealing with multiple registries.</p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apax_overview.svg); background-repeat: no-repeat; background-size: contain">
  </div>
</div>
----
<div class="grid-slide-ressources">
  <div class="grid-slide-header">
    <header class="slide_header">
      <h2>Introduction to package management</h2>
      <h3>Understanding package versions</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>Packages in Apax use semantic versioning (semver): <code>MAJOR.MINOR.PATCH</code>.</p>
    <ul>
      <li><strong>MAJOR:</strong> incompatible changes (e.g., <code>1.0.0</code> to <code>2.0.0</code>)</li>
      <li><strong>MINOR:</strong> new features, backward-compatible (e.g., <code>1.0.0</code> to <code>1.1.0</code>)</li>
      <li><strong>PATCH:</strong> bug fixes, backward-compatible (e.g., <code>1.0.0</code> to <code>1.0.1</code>)</li>
    </ul>
    <p>Examples:</p>
    <ul>
      <li><code>@ax/system-timer@1.0.0</code> to <code>@ax/system-timer@2.0.0</code>: major update</li>
      <li><code>@ax/system-timer@1.0.0</code> to <code>@ax/system-timer@1.1.0</code>: minor update</li>
      <li><code>@ax/system-timer@1.0.0</code> to <code>@ax/system-timer@1.0.1</code>: patch update</li>
    <p>the caret symbol <code>^</code> in version (e.g., <code>^1.0.0</code>) allows updates that do not change the first non-zero digit (e.g., <code>1.x.x</code>). Example <code>apax.yml</code> configuration:
    <pre><code>
    dependencies:
      "@ax/system-timer": ^1.0.0
    </code></pre>
    </p>
</div>
----

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Introduction to apax</h2>
        <h3>Use apax inside the GUI</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>Alternatively you can use apax from the command palette inside of SIMATIC AX Code</p>
    <br>
    <p>There are two types of dependencies:</p>
    <ul>
        <li><strong>dependencies:</strong> required for the project to run</li>
        <li><strong>devDependencies:</strong> required for development and testing but not for running the project</li>
    </ul>
    <div class="definition">dependencies are like ingredients in a recipe, while devDependencies are like the tools used to prepare the recipe.</div>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apax_overview.svg); background-repeat: no-repeat; background-size: contain">
  </div>
</div>

----

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Introduction to apax</h2>
        <h3>Package management</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>Before we continue, we first must understand the package management part of apax.</p>
    <br>
    <div class="definition">A package manager keeps track of what software is installed on your computer, and allows you to easily install new software, upgrade software to newer versions, or remove software that you previously installed.<sup><a href="https://web.archive.org/web/20171017151526/http://aptitude.alioth.debian.org/doc/en/pr01s02.html">[1]</a></sup></div>
    <p>
    <code>apax</code> will retrieve libraries and tools (&wedgeq;packages) required for your project from one or multiple central databases (called registries) and download them to your PC.
    </p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apax_registries.svg); background-repeat: no-repeat; background-size: contain">
  </div>
</div>

---
<div class="grid-slide-container">
  <div class="grid-slide-header">
  <header class="slide_header">
    <h2>Use Apax</h2>
    <h3>Overview</h3>
  </header>
  </div>
  <div class="grid-slide-text">
  <p>In this section, you will learn about:</p>
  <ul>
    <li>verify Apax installation: <code>apax --version</code></li>
    <li>create projects with templates: <code>apax create [template] [project-name]</code></li>
    <li>important templates: <strong>app</strong>, <strong>lib</strong>, <strong>empty</strong>, <strong>quickstart</strong>, <strong>workspace</strong>, <strong>template</strong></li>
    <li>project structure: <strong>apax.yml</strong>, <strong>src/</strong>, <strong>test/</strong></li>
    <li>install dependencies: <code>apax install</code></li>
  </ul>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/use_apax_overview.svg); background-repeat: no-repeat; background-size: contain">
  </div>
</div>

----

<div class="grid-slide-container">
  <div class="grid-slide-header">
  <header class="slide_header">
    <h2>Use Apax</h2>
    <h3>First use of Apax</h3>
  </header>
  </div>
  <div class="grid-slide-text">
  <p>To verify that Apax is installed correctly and to check its version, you can use the following command in your terminal:</p>
  <pre><code>apax --version</code></pre>
  <br>
  <p>this command will display the current version of Apax installed on your system.</p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apax_version.gif); background-repeat: no-repeat; background-size: contain">
  </div>
</div>

----
<div class="grid-slide-container">
  <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Introduction to apax</h2>
        <h3>Package management</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>To download any package, we must first authenticate against the registries. Execute the login command:</p>
    <br>
    <pre><code>apax login</code></pre>
    <p> This automatically open your default browser and guide you through the login process. Alternatively you may navigate to <a href="https://console.simatic-ax.siemens.io/settings/tokens">the tokens configuration page</a> and execute the command as follows: 
    </p>
    <pre><code>apax login --registry https://registry.simatic-ax.siemens.io/ --password TOKEN</code></pre>
    <p>Here, TOKEN must be replaced with the previously generated token.</p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apax_login.gif); background-repeat: no-repeat; background-size: contain">
  </div>
</div>
----
<div class="grid-slide-container">
  <div class="grid-slide-header">
    <header class="slide_header">
      <h2>Using Apax</h2>
      <h3>Creating a project - project templates</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <ul>
      <li>with Apax, projects can be created based on so-called project templates</li>
      <li>each project template is essentially a package that is downloaded and unpacked as a new project using the command <code>apax create</code></li>
      <li>the advantage is that there are not only fixed project templates; every user can create their own project templates and store them in a registry to make them available</li>
    </ul>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/create_project.gif); background-repeat: no-repeat; background-size: contain">
  </div>
</div>

----
<div class="grid-slide-container">
  <div class="grid-slide-header">
    <header class="slide_header">
      <h2>Using Apax</h2>
      <h3>Creating a project - important project templates</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>There are two main templates you can use with <code>apax create</code>:</p>
    <ul>
      <li><strong>app:</strong> this template is used to create an application project. An application project is designed to run on a real runtime environment, such as an S7-1500 PLC</li>
      <li><strong>lib:</strong> this template is used to create a library project. A library project is intended to be published as a package and can be reused in applications or other libraries</li>
    </ul>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/create_project.gif); background-repeat: no-repeat; background-size: contain">
  </div>
</div>

----
<div class="grid-slide-container">
  <div class="grid-slide-header">
    <header class="slide_header">
      <h2>Using Apax</h2>
      <h3>Creating a project - further templates</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>In addition to the <strong>app</strong> and <strong>lib</strong> templates, Apax offers several other templates to help you get started with different types of projects:</p>
    <ul>
      <li><strong>empty</strong> a generic template for creating a minimal project setup</li>
      <li><strong>quickstart</strong> a template designed to help you quickly get started with Simatic AX</li>
      <li><strong>workspace</strong> a template for setting up a workspace with multiple projects</li>
      <li><strong>template</strong> a template for custom template that can be created and used based on specific user requirements</li>
    </ul>
    <p>These templates can be used to streamline the project creation process and ensure that you have the necessary structure and dependencies in place from the start.</p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/create_project.gif); background-repeat: no-repeat; background-size: contain">
  </div>
</div>
----
<div class="grid-slide-container">
  <div class="grid-slide-header">
    <header class="slide_header">
      <h2>Using Apax</h2>
      <h3>Creating a project - Apax create</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>The <code>apax create</code> command allows you to create a new project from a template. The syntax for this command is:</p>
    <pre><code>apax create [template] [project-name]</code></pre>
    <p>Here, <code>[template]</code> is the name of the template you want to use, and <code>[project-name]</code> is the name of the new project. There are several templates available, but the most important ones are <strong>app</strong> and <strong>lib</strong>.</p>
    <p>For example, to create a new application project named "my-first-app", you would use the following command:</p>
    <pre><code>apax create app my-first-app</code></pre>
  </div>
    <div class="grid-slide-ressources">
    <ol>
      <li>apax create CLI reference: <br><a href="https://console.simatic-ax.siemens.io/docs/apax/cli#create">https://console.simatic-ax.siemens.io/docs/apax/cli#create</a></li>
    </ol>
</div>
  <div class="grid-slide-image" style="background-image: url(../img/create_project.gif); background-repeat: no-repeat; background-size: contain">
  </div>
</div>
----
<div class="grid-slide-container">
  <div class="grid-slide-header">
    <header class="slide_header">
      <h2>Using Apax</h2>
      <h3>Creating a project - generated project structure</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>After creating the project and opening it in AxCode, you will see the following structure:</p>
    <ul>
      <li><strong>apax.yml:</strong> the project manifest file, which we will explore in the next slide</li>
      <li><strong>src/:</strong> contains all the source code for your project, including a <code>configuration.st</code> and a <code>program.st</code>, both written in Structured Text, a standardized language for automation systems. These files will be covered in detail in the chapter on ST Programming</li>
      <li><strong>test/:</strong> contains unit tests for your project</li>
    </ul>
    <p>This structure helps in organizing your project files and dependencies efficiently.</p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/ax_project_structure.png); background-repeat: no-repeat; background-size: contain">
  </div>
</div>

<!-- ----
<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Create a new project</h2>
        <h3>Using the apax extension</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>To create a new project with the apax extension you can execute the following steps:</p>
    <ol>
        <li>1. open a new SIMATIC AX Code window in the navigation bar <code>File &rarr; New Window</code></li>
        <li>2. open the apax extension on the left side</li>
        <li>3. select the @ax/app template, enter a project name and choose a directory</li>
    </ol>
    <p>This will download a special package called template and uncompress it into a new folder under the selected directory.</p>
 </div>
  <div class="grid-slide-image" style="background-image: url(../img/apax_extension.png); background-repeat: no-repeat; background-size: contain">
    <p>Placeholder for an image showing apax extension</p>
  </div>
  <div class="grid-slide-ressources">
   <ol>
      <li>AX Templates: <a href="https://console.simatic-ax.siemens.io/docs/apax/templates#templates">https://console.simatic-ax.siemens.io/docs/apax/templates</a></li>
    </ol>
  </div>
</div> -->

----
<div class="grid-slide-container">
  <div class="grid-slide-header">
  <header class="slide_header">
    <h2>Using Apax</h2>
    <h3>Creating a project - the apax.yml</h3>
  </header>
  </div>
  <div class="grid-slide-text">
    <p>To create a new project from the command line you can execute the following steps:</p>
    <ol>
        <li>1. open a new terminal <code>Terminal &rarr; New Terminal</code></li>
        <li>2. enter the command <pre><code>apax create app my-app</code></pre></li>
    </ol>
    <p> This will create a folder named my-app and place a new project inside that folder.</p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apax_cli_create.png); background-repeat: no-repeat; background-size: contain">
  </div>
  <div class="grid-slide-ressources">
    <ol>
      <li>apax.yml manifest reference: <br><a href="https://console.simatic-ax.siemens.io/docs/apax/yml">https://console.simatic-ax.siemens.io/docs/apax/yml</a></li>
    </ol>
</div>
  <div class="grid-slide-image" style="background-image: url(../img/apaxyml.png); background-repeat: no-repeat; background-size: contain">
  </div>
</div>

----

<div class="grid-slide-container">
  <div class="grid-slide-header">
    <header class="slide_header">
      <h2>Using Apax</h2>
      <h3>Creating a project - understanding the field: type</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>Now that we have created a project let's explore the created files and understand the structure. The following files and directories will be present inside your project:</p>
    <ul>
      <li><strong>app:</strong> an application that can be deployed to PLCs</li>
      <li><strong>lib:</strong> a library that can be reused by other packages</li>
      <li><strong>generic:</strong> a package that contains arbitrary files</li>
      <li><strong>catalog:</strong> a package that defines a set of catalogDependencies</li>
      <li><strong>workspace:</strong> the root of a multi-project workspace</li>
    </ul>
    <p>In the following slides these points will be described in more detail.</p>
  </div>
    <div class="grid-slide-ressources">
    <ol>
      <li>apax.yml field type: <br><a href="https://console.simatic-ax.siemens.io/docs/apax/yml#type">https://console.simatic-ax.siemens.io/docs/apax/yml#type</a></li>
    </ol>
</div>
  <div class="grid-slide-image" style="background-image: url(../img/apaxyml.png); background-repeat: no-repeat; background-size: contain">
  </div>
</div>

----

<div class="grid-slide-container">
  <div class="grid-slide-header">
      <header class="slide_header">
      <h2>Using Apax</h2>
      <h3>Creating a project - understanding type app and lib</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>The src directory usually contains the complete Structured Text related to your machine program or library.
    <br>
    The template comes with a minimal skeleton of code placed inside configuration.st and program.st. The code is written in Structured Text, a standardized language for automation systems.
    </p>
    <p>We will explore these files in the upcoming chapters.<br> For more information you can check out <a href="https://console.simatic-ax.siemens.io/docs/st/language">the documentation</a>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apaxyml.png); background-repeat: no-repeat; background-size: contain">
  </div>
</div>
----
<div class="grid-slide-container">
  <div class="grid-slide-header">
    <header class="slide_header">
      <h2>Using Apax</h2>
      <h3>Creating a project - understanding the field: devDependencies</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>The test directory usually contains definitions of test cases, provided in Structured Text as well, to test the functionality of your code from the src directory. You may extend the content of that directory to define more tests.
    <br>
    These unit tests can be used to test and verify the functionality without any simulation or machine as a prerequisite.
    </p>
    <p>We will explore unit testing in the upcoming chapters.<br> For more information you can check out <a href="https://console.simatic-ax.siemens.io/docs/axunitst">the documentation</a>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apaxyml.png); background-repeat: no-repeat; background-size: contain">
  </div>
</div>

----

<div class="grid-slide-container">
  <div class="grid-slide-header">
    <header class="slide_header">
      <h2>Using Apax</h2>
      <h3>Creating a project - understanding the field: targets</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>The <code>targets</code> field in the <code>apax.yml</code> file specifies the target platforms for your project. Currently, the possible values are <strong>1500</strong> and <strong>LLVM</strong>.</p>
    <ul>
      <li><strong>1500:</strong> this target is used for S7-1500 PLCs</li>
      <li><strong>LLVM:</strong> this target is used for the AxUnit Testing Framework</li>
    </ul>
    <p>By defining the target, you ensure that the project is compiled and built for the correct platform, whether it's for deployment on a PLC or for running unit tests.</p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apaxyml.png); background-repeat: no-repeat; background-size: contain">
  </div>
</div>
----
<div class="grid-slide-container">
  <div class="grid-slide-header">
    <header class="slide_header">
      <h2>Using Apax</h2>
      <h3>Installing dependencies</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>First lets see the apax.yml; this file is the project manifest, containing metadata and all dependencies required for this project.
    Here you can define everything that is specific for this project, automate your workflows with scripts and tell the compiler, where the code is supposed to run.
    </p>
    <br>
    <p>We will explore this file step by step in the upcoming chapters.<br/> For more information you can check out <a href="https://console.simatic-ax.siemens.io/docs/apax/yml">the documentation</a>
  </div>
      <div class="grid-slide-ressources">
    <ol>
      <li>apax package management: <a href="https://console.simatic-ax.siemens.io/docs/apax/yml#package-management">https://console.simatic-ax.siemens.io/docs/apax/yml#package-management</a></li>
    </ol>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apax_install.gif); background-repeat: no-repeat; background-size: contain">
  </div>

----

<div class="grid-slide-container">
  <div class="grid-slide-header">
    <header class="slide_header">
      <h2>Using Apax</h2>
      <h3>Adding dependencies</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>Besides tooling, which is used to operate your project during engineering, you may want to make use of libraries which provide additional functionality for your machine application. In order to distinguish these 2 types of dependencies, the <code>dependencies</code> and <code>devDependencies</code> property are being used. 
    <br>
    <p>You can think of creating a project like baking a cake; you need two categories of things:</p>
    <ul>
      <li>the <code>@ax/system-timer</code> package is fetched from the registry</li>
      <li>the <code>apax.yml</code> has a new entry <code>dependencies:</code></li>
      <pre><code>dependencies:
      "@ax/system-timer": ^8.0.8</code></pre>
      <li>the <code>apax-lock.json</code> file is updated to lock the version of the added package</li>
    </ul>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apax_add.gif); background-repeat: no-repeat; background-size: contain">
  </div>
</div>

<!-- ---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Building the project</h2>
        <h3>Installing dependencies</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>To download these packages you have to execute the following command:</p>
    <pre><code>apax install</code></pre>
    <br>
    <p>This will collect all dependencies and devDependencies of the apax.yml and download them to the .apax folder.</p>
    <p>Additionally it will create an apax-lock.json file. This file contains a snapshot of all packages and their respective version that have been installed.</p>
  </div>
  <div class="grid-slide-image">
    <pre><code data-line-numbers data-trim data-noescape>
    "packages": {
      "@ax/hwc": {
        "name": "@ax/hwc",
        "version": "1.0.225",
        "integrity": "sha512-fesFsmJoCz3...",
        "dependencies": {
          "@ax/hwc-win-x64": "1.0.225",
          "@ax/hwc-linux-x64": "1.0.225"
        }
      },
      "@ax/hwld": {
        "name": "@ax/hwld",
        "version": "1.0.75",
        ...
      }
    </code><pre>
  </div>
  <div class="grid-slide-ressources">
    <ol>
     <li>apax install CLI reference: <br><a href="https://console.simatic-ax.siemens.io/docs/apax/cli#install">https://console.simatic-ax.siemens.io/docs/apax/cli#install</a></li>
      <li>package-locks: <br><a href="https://docs.npmjs.com/cli/v6/configuring-npm/package-locks">https://docs.npmjs.com/cli/v6/configuring-npm/package-locks</a></li>
    </ol>
  </div>
</div> -->
---
<div class="grid-slide-container">
  <div class="grid-slide-header">
  <header class="slide_header">
    <h2>Building the project</h2>
    <h3>Overview</h3>
  </header>
  </div>
  <div class="grid-slide-text">
  <p>In this section, you will learn about:</p>
  <ul>
    <li>how to build the project using Apax: <code>apax build</code></li>
    <li>the role of the Structured Text compiler (stc) in the build process</li>
    <li>where to find the generated binaries</li>
  </ul>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apax_build_overview.svg); background-repeat: no-repeat; background-size: contain">
  </div>
</div>
----
<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Building the project</h2>
        <h3>Compiling the source code</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>Now that all packages have been installed, we can build the project using the command:</p>
    <pre><code>apax build</code></pre>
    <br>
    <p>This will invoke the <code>stc</code> (Structured Text compiler) and transform the source code into a target specific binary. This binary can then be loaded onto the PLC.</p>
    <br>
    <p>The compiler will check for any syntactical or semantical errors and abort the compilation if the code has errors.</p>
  </div>
  <div class="grid-slide-image">
    <pre><code data-trim data-noescape data-line-numbers>
    > apax build  
   ✔ Package verification succeeded.
    using targets 
    stc --input C:\MyProject\src 
        --target s7generic --output bin\1500 
        --compile-to app:myapp:0.1.0 --debug
    AX Structured Text (ST) compiler V7.0.52.28545.
    info: stc[0]
    Compile finished with 0 error(s).
    </code><pre>
  </div>
  <div class="grid-slide-ressources">
    <ol>
      <li>stc CLI reference: <br><a href="https://console.simatic-ax.siemens.io/docs/st/cli#stc-command-line-reference">https://console.simatic-ax.siemens.io/docs/st/cli#stc-command-line-reference</a></li>
    </ol>
  </div>
</div>

----

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Building the project</h2>
        <h3>Compiling the source code</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>Now that you have compiled, you will be able to find the binary file in the respective target subfolder in the bin directory. You can define the target in the apax.yml manifest.</p>
    <br>
    <div class="warning">
      Note that you have to recompile every time you want to download changes, otherwise the old binary will be loaded.
    </div>
  </div>
  <div class="grid-slide-image">
    <pre><code data-line-numbers = "5" data-trim data-noescape>
    > apax build  
   ✔ Package verification succeeded.
    using targets 
    stc --input C:\MyProject\src 
        --target s7generic --output bin\1500 
        --compile-to app:myapp:0.1.0 --debug
    AX Structured Text (ST) compiler V7.0.52.28545.
    info: stc[0]
    Compile finished with 0 error(s).
    </code><pre>
  </div>
</div>

----
<div class="grid-slide-container">
  <div class="grid-slide-header">
    <header class="slide_header">
      <h2>Getting Started</h2>
      <h3>Complete Workflow</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>For a detailed guide on the complete workflow from creating a project to downloading it onto a PLC, refer to the <strong>Getting Started</strong> guide.</p>
    <p>In the <strong>Getting Started</strong> guide, you will learn about:</p>
    <ul>
      <li>creating a new project using Apax templates</li>
      <li>installing dependencies with <code>apax install</code></li>
      <li>building the project using <code>apax build</code></li>
      <li>downloading the compiled binary to a PLC</li>
      <li>monitor and debug the application</li>
    </ul>
  </div>
  <div class="grid-slide-ressources">
    <ol>
      <li>Getting Started: <br><a href="https://console.simatic-ax.siemens.io/docs/get-started/guides_overview">https://console.simatic-ax.siemens.io/docs/get-started/guides_overview</a></li>
    </ol>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/getting_started_workflow.svg); background-repeat: no-repeat; background-size: contain">
  </div>
</div>



---

<header class="slide_header">
  <h2>
        What did you learn
  </h2>
</header>

<div class="grid-two-col-foc-right">
  <div class="flex-col justify-center">
    <p>In this section you learned about...</p>
    <ul>
      <li>what apax is</li>
      <li>basics of package management</li>
      <li>how to create a project from a template and its basic structure</li>
      <li>how to build the project</li>
    </ul>
    <br>
    <p>you can now create your own project and continue with the next section</p>
  </div>
</div>
