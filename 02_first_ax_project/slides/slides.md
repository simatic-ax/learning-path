---
title: Get started with apax and AX Projects
progress: true
revealOptions:
  transition: 'fade'
mouseWheel: true,
---

# Agenda

|  |  |
| -- | ----- |
| 00 | Introduction to the workshop |
| 01 | Introduction to AX Code IDE |
| **02** | **Get started with Apax and AX Projects** |
| 03 | Loading and Debugging |
| 04 | Introduction to ST Programming |
| 05 | OOP Elements of ST |
| 06 | Unit Testing |
| 07 | Tools for commissioning |
| 08 | Package management |
| 09 | Versioning and Continuous Integration |

----
<header class="slide_header">
  <h2>
        What will you learn in this chapter
  </h2>
</header>

<div class="grid-two-col-eq">
  <div class="flex-col justify-center">
    <p>After you completed this training section you will </p>
        <ul>
            <li>understand the basics of package management</li>
            <li>know how to use apax to create and build a new project</li>
            <li>have learned about:</li>
            <ul>
                <li>the overall structure of an AX project </li>
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
    <li>To get started, you need to have SIMATIC AX, apax and all its prerequisites installed. </li>
    <li>In addition, you should know the basics on how to use AX Code.</li>
    <li>Basic knowledge of using the command line interface (CLI) is also required. This includes:</li>
    <ul>
      <li>How to open a CLI.</li>
      <li>How to change directories.</li>
      <li>How to execute commands.</li>
    </ul>
    <br/>
    <li>With this, you are set up to continue with this learning path.</li>
  </div>
</div>

---
<div class="grid-slide-container">
  <div class="grid-slide-header">
  <header class="slide_header">
  <h2>Introduction to Package Management</h2>
  <h3>Overview</h3>
  </header>
  </div>
  <div class="grid-slide-text">
  <p>In this chapter, you will learn about:</p>
  <ul>
    <li>What package management is and why it is important.</li>
    <li>The role of apax in package management within Simatic AX.</li>
    <li>Key concepts such as dependencies, registries, and packages.</li>
    <li>How to create and manage projects using apax.</li>
  </ul>
  </div>
    <div class="grid-slide-image" style="background-image: url(../img/apax_overview.svg); background-repeat: no-repeat">
    </div>
  </div>
</div>

----

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
    <h2>Introduction to Package Management</h2>
    <h3>What is Apax?</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <li>Apax is the central tool within Simatic AX, acting as a package manager and a build tool.</li>
    <li>Apax is a command line interface tool that serves as a package manager and facilitator for each step in the development workflow.</li>
    <li>It helps you create, build, and manage AX projects efficiently.</li>
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
    <h2>Introduction to Package Management</h2>
    <h3>What is a Package Manager?</h3>
  </header>
  </div>
  <div class="grid-slide-text">
  <li>A package manager is a tool that automates the process of installing, updating, and managing software packages and their dependencies.</li>
  <br>
  <li>It retrieves libraries and tools (packages) required for your project from central databases (registries) and downloads them to your PC.</li>
  <div class="definition">A package manager simplifies the process of managing software dependencies and ensures that your project has all the necessary components to run correctly.</div>
  <p>Common examples of package managers include npm for JavaScript, pip for Python, and apax for AX projects.</p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apax_overview.svg); background-repeat: no-repeat; background-size: contain">
  </div>
</div>

----

<div class="grid-slide-container">
  <div class="grid-slide-header">
  <header class="slide_header">
    <h2>Introduction to Package Management</h2>
    <h3>What are Dependencies?</h3>
  </header>
  </div>
  <div class="grid-slide-text">
  <p>Dependencies are external libraries or tools that your project needs to function correctly. They help you avoid reinventing the wheel by reusing pre-existing code.</p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/package_manager_overview.png); background-repeat: no-repeat; background-size: contain">
  <p>Placeholder for an image explaining dependencies</p>
  </div>
</div>

----

<div class="grid-slide-container">
  <div class="grid-slide-header">
  <header class="slide_header">
    <h2>Introduction to Package Management</h2>
    <h3>What is a Registry?</h3>
  </header>
  </div>
  <div class="grid-slide-text">
  <p>A registry is a central database where packages are stored and maintained. It acts as a repository from which package managers can retrieve the necessary packages.</p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/package_manager_overview.png); background-repeat: no-repeat; background-size: contain">
  <p>Placeholder for an image explaining registries</p>
  </div>
</div>

----

<div class="grid-slide-container">
  <div class="grid-slide-header">
  <header class="slide_header">
    <h2>Introduction to Package Management</h2>
    <h3>What is a Package?</h3>
  </header>
  </div>
  <div class="grid-slide-text">
  <p>A package is a bundle of code that provides specific functionality and can be easily shared and reused. It typically includes compiled code, configuration files, and metadata.</p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/package_manager_overview.png); background-repeat: no-repeat; background-size: contain">
  <p>Placeholder for an image explaining packages</p>
  </div>
</div>

----

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Introduction to Package Management</h2>
        <h3>Understanding Dependencies</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>Dependencies are external libraries or tools that your project needs to function correctly.</p>
    <br>
    <p>There are two types of dependencies:</p>
    <ul>
        <li><strong>Dependencies:</strong> Required for the project to run.</li>
        <li><strong>DevDependencies:</strong> Required for development and testing but not for running the project.</li>
    </ul>
    <div class="definition">Dependencies are like ingredients in a recipe, while devDependencies are like the tools used to prepare the recipe.</div>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/dependencies_vs_devdependencies.png); background-repeat: no-repeat; background-size: contain">
    <p>Placeholder for an image explaining dependencies vs devDependencies</p>
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
    <li>How to use Apax for managing your AX projects.</li>
    <li>Basic commands and their usage.</li>
    <li>Creating and managing projects with Apax.</li>
    <li>Building and compiling your projects.</li>
  </ul>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/use_apax_overview.svg); background-repeat: no-repeat; background-size: contain">
  <p>Placeholder for an image showing Apax usage overview</p>
  </div>
</div>

----

<div class="grid-slide-container">
  <div class="grid-slide-header">
  <header class="slide_header">
    <h2>Use Apax</h2>
    <h3>First Use of Apax</h3>
  </header>
  </div>
  <div class="grid-slide-text">
  <p>To verify that Apax is installed correctly and to check its version, you can use the following command in your terminal:</p>
  <pre><code>apax --version</code></pre>
  <br>
  <p>This command will display the current version of Apax installed on your system.</p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apax_version.png); background-repeat: no-repeat; background-size: contain">
  <p>Placeholder for an image showing the output of apax --version</p>
  </div>
</div>
----
<div class="grid-slide-container">
  <div class="grid-slide-header">
    <header class="slide_header">
      <h2>Using Apax</h2>
      <h3>Creating a New Project with Apax</h3>
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
      <h3>Projects overview</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>There are two main templates you can use with <code>apax create</code>:</p>
    <ul>
      <li><strong>app:</strong> This template is used to create an application project. An application project is designed to run on a real runtime environment, such as an S7-1500 PLC.</li>
      <li><strong>lib:</strong> This template is used to create a library project. A library project is intended to be published as a package and can be reused in applications or other libraries.</li>
    </ul>
  </div>
    <div class="grid-slide-yml">
    <pre><code># General information
name: "my-first-app"
version: 1.0.0
type: app
# Description for your application example or app
description: First exercise of the chapter Unit Testing
# Targets to be compiled with 'apax build'
targets:
  - "1500"
  - llvm
# Dependencies
devDependencies:
  "@ax/sdk": 2405.0.0
</code></pre>
  </div>
</div>
----
<div class="grid-slide-container">
  <div class="grid-slide-header">
    <header class="slide_header">
      <h2>Using Apax</h2>
      <h3>Further Templates</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>In addition to the <strong>app</strong> and <strong>lib</strong> templates, Apax offers several other templates to help you get started with different types of projects:</p>
    <ul>
      <li><strong>empty</strong> A generic template for creating a minimal project setup.</li>
      <li><strong>quickstart</strong> A template designed to help you quickly get started with Simatic AX.</li>
      <li><strong>workspace</strong> A template for setting up a workspace with multiple projects.</li>
      <li><strong>template</strong> A template for custom template that can be created and used based on specific user requirements.</li>
    </ul>
    <p>These templates can be used to streamline the project creation process and ensure that you have the necessary structure and dependencies in place from the start.</p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apax_templates.png); background-repeat: no-repeat; background-size: contain">
    <p>Placeholder for an image showing different Apax templates</p>
  </div>
</div>
----
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
        <li>1. open a new AX Code window in the navigation bar <code>File &rarr; New Window</code></li>
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
</div>

----
<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Using Apax</h2>
        <h3>Installing Dependencies</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>To download and install the dependencies for your project, you can use the following command:</p>
    <pre><code>apax install</code></pre>
    <br>
    <p>This command will collect all dependencies and devDependencies listed in the apax.yml file and download them to the .apax folder.</p>
    <p>Additionally, it will create an apax-lock.json file, which contains all the installed packages and their versions.</p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apax_install.png); background-repeat: no-repeat; background-size: contain">
    <p>Placeholder for an image showing apax install process</p>
  </div>
</div>

---
<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Create a new project</h2>
        <h3>Using the apax CLI</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>To create a new project from the command line you can execute the following steps:</p>
    <ol>
        <li>1. open a new terminal <code>Terminal &rarr; New Terminal</code></li>
        <li>2. enter the command <pre><code>apax create app my-app</code></pre></li>
    </ol>
    <p> This will create a new project in the my-app folder, called my-app from the app template.</p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apax_cli_create.png); background-repeat: no-repeat; background-size: contain">
    <p>Placeholder for an image showing apax CLI create command</p>
  </div>
  <div class="grid-slide-ressources">
    <ol>
      <li>apax create CLI reference: <br><a href="https://console.simatic-ax.siemens.io/docs/apax/cli#create">https://console.simatic-ax.siemens.io/docs/apax/cli#create</a></li>
    </ol>
</div>

---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Project overview</h2>
        <h3>Structure of the project</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>Now that we have created a project let's explore the created files  and understand the structure. We have the following files and directories in our project:</p>
    <ul>
        <li>src/</li>
        <li>lib/</li>
        <li>apax.yml</li>
    </ul>
    <p>In the following slides these points will be described in more detail</p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/ax_project_structure.png); background-repeat: no-repeat; background-size: contain">
    <p>Placeholder for an image showing project structure</p>
  </div>
</div>

----

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Project overview</h2>
        <h3>src directory</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>In the src directory you can find all the software code that belongs to your machine program.
    <br>
    In the template there should be a configuration.st and a program.st, both written in Structured Text, a standardized language for automation systems.
    </p>
    <p>We will explore these files in the following chapters.<br> For more information you can check out <a href="https://console.simatic-ax.siemens.io/docs/st/language">the documentation</a>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/ax_project_structure.png); background-repeat: no-repeat; background-size: contain">
  </div>
</div>
----
<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Project overview</h2>
        <h3>test directory</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>In the test directory you can create the unit tests for your program.
    <br>
    These unit tests can be used to test and verify the functionality without any simulation or machine as a prerequisite.
    </p>
    <p>We will explore unit testing in the following chapters.<br> For more information you can check out <a href="https://console.simatic-ax.siemens.io/docs/axunitst">the documentation</a>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/ax_project_structure.png); background-repeat: no-repeat; background-size: contain">
  </div>
</div>
----
<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Project overview</h2>
        <h3>apax.yml</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>First check out the apax.yml; this file is the project manifest, containing metadata and all dependencies required for this project.
    Here you can define everything that is specific for this project, automate your workflows with scripts and tell the compiler, where the code is supposed to run.
    </p>
    <br>
    <p>We will explore this file step by step in the following chapters.<br> For more information you can check out <a href="https://console.simatic-ax.siemens.io/docs/apax/yml">the documentation</a>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apax_yml.svg); background-repeat: no-repeat; background-size: contain">
  </div>
</div>
---
<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Building the project</h2>
        <h3>Understanding dependencies</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>To build the project we first need to get all required tools (e.g. the compiler). Unlike other tools, where build tools are installed statically and need to be updated globally, AX is using an on-demand system, where each project references the version of the SDK (software development kit) it is built with.
    <br>
    In the apax.yml we can see which version we are referencing under the <code>devDependencies</code> section.
    </p>
  </div>
  <div class="grid-slide-image">
    <pre><code data-line-numbers="7-8" data-line-numbers data-trim data-noescape>
    name: "my-app"
    version: 0.0.0
    type: app
    <br>
    ...
    <br>
    devDependencies:
        "@ax/sdk": 2405.0.0
    </code><pre>
  </div>
  <div class="grid-slide-ressources">
    <ol>
      <li>apax package management: <a href="https://console.simatic-ax.siemens.io/docs/apax/yml#package-management">https://console.simatic-ax.siemens.io/docs/apax/yml#package-management</a></li>
      <li>AX packages <a href="https://console.simatic-ax.siemens.io/docs/apax/packages">https://console.simatic-ax.siemens.io/docs/apax/packages</a></li>
    </ol>
  </div>
</div>
---
<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Building the project</h2>
        <h3>Difference between dependencies and devDependencies</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>The SDK is not the only package you can reference, there are also libraries that you can use in your code. Here we encounter the difference between <code>dependencies</code> and <code>devDependencies</code> 
    <br>
    <p>You can think of creating a project like baking a cake; you need two categories of things:</p>
    <ul>
        <li>Ingredients (e.g flour, sugar) are <strong>dependencies</strong> that you put in your cake. Same is true for your software libraries, you need your timer implementation in your final compiled app.</li>
        <li>Baking utilities (e.g. mixer) are like <strong>devDependencies</strong>. You need them to create the cake, but you don't want to put the mixer in your cake.</li>
    </ul>
  </div>
  <div class="grid-slide-image">
    <pre><code data-line-numbers="7-10" data-line-numbers data-trim data-noescape>
    name: "my-app"
    version: 0.0.0
    type: app
    <br>
    ...
    <br>
    devDependencies:
        "@ax/sdk": 2405.0.0
    dependencies:
        "@ax/system-timer": 7.0.17 
    </code><pre>
  </div>
</div>
---

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
    <p>Additionally it will create an apax-lock.json file. This file will contain all packages that have been installed, when you check it you will see, that the SDK has a lot of sub-dependencies that it brings along.</p>
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
</div>
---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Building the project</h2>
        <h3>Compiling the source code</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>Now that all packages have been installed, we can build the project using this command:</p>
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

---

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
      <li>what apax is.</li>
      <li>basics of package management</li>
      <li>how to create a project from a template and its basic structure.</li>
      <li>how to build the project.</li>
    </ul>
    <br>
    <p>You can now create your own project and continue with the next section.</p>
  </div>
</div>
