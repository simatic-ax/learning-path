---
title: Introduction to the AX Code IDE 
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
    <p>To get started, you need to have SIMATIC AX, apax and all its prerequisites installed. </p>
    <p>In addition you should know the basics on how to use AX Code
    </p>
    <br/>
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
    <p>After you completed this training section you will </p>
        <ul>
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

---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Introduction to apax</h2>
        <h3>What is apax</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>To create a new project from a template we first need to understand how to retrieve a template at all.</p>
    <br>
    <p>For this we will use the tool <code>apax</code> that we have installed in the previous step</p>
    <div class="definition"><code>apax</code> is a command line interface tool that serves as a package manager and facilitator for each step in the development workflow.</div>
    <p>We will learn more about this tool in the following section<p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apax_overview.svg); background-repeat: no-repeat">
  </div>
</div>

---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Introduction to apax</h2>
        <h3>How to use apax</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>Apax can be used from:</p>
    <ul>
        <li>the command line/ terminal</li>
        <li>from an extension</li>
        <li>AX Code command palette</li>
    </ul>
    <br>
    <p>
    To test if apax is installed on your machine, you can open up a new terminal and enter
    </p>
    <br>
    <pre><code data-trim data-noescape>apax</code></pre>
    <br>
    <p>This will prompt you with all the commands that apax is capable of executing as well as the version of apax that you have installed.</p>
    
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apax_cmd_output.png); background-repeat: no-repeat; background-size: contain">
  </div>
</div>

---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Introduction to apax</h2>
        <h3>Use apax in the GUI</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>Alternatively you can use apax from the command palette in AX Code</p>
    <br>
    <p>
    Press <code>F1</code> and enter apax to see all available commands.
    </p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apax_command_palette.png); background-repeat: no-repeat; background-size: contain">
  </div>
</div>

---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Introduction to apax</h2>
        <h3>Package managment</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>Before we continue, we first must understand the package management part of apax</p>
    <br>
    <div class="definition">A package manager is a tool for automated handling of installing and updating of software and its dependencies.<sup><a href="https://web.archive.org/web/20171017151526/http://aptitude.alioth.debian.org/doc/en/pr01s02.html">[1]</a></sup></div>
    <p>
    <code>apax</code> will automatically retrieve libraries and tools (&wedgeq;packages) required for your project from one or multiple central databases (called registries) and download them to your PC.
    </p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apax_registries.svg); background-repeat: no-repeat; background-size: contain">
  </div>
</div>
---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Introduction to apax</h2>
        <h3>Package managment</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>To download these packages, we must first authenticate against the registries. Execute an login command:</p>
    <br>
    <pre><code>apax login</code></pre>
    <p> This will guide you through the login process and should use the browser for a single sign on. If this is not working, <a href="https://console.simatic-ax.siemens.io/settings/tokens">create a token on your user account</a> and execute the command as follows: 
    </p>
    <pre><code>apax login --password TOKEN</code></pre>
    <p>where TOKEN is your generated token</p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/apax_registries.svg); background-repeat: no-repeat; background-size: contain">
  </div>
</div>
---

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
  </div>
  <div class="grid-slide-ressources">
   <ol>
      <li>AX Templates: <a href="https://console.simatic-ax.siemens.io/docs/apax/templates#templates">https://console.simatic-ax.siemens.io/docs/apax/templates</a></li>
    </ol>
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
