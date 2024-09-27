---
title: Package management
progress: true
revealOptions:
  transition: 'fade'
mouseWheel: true,


---

# Agenda

| **ID** | **Topic** |
| -- | ----- |
| 00 | Introduction to the workshop |
| 01 | Introduction to AX Code IDE |
| 02 | Get started with your first AX Project |
| 03 | Loading and Debugging |
| 04 | Introduction to ST Programming |
| 05 | OOP Elements of ST |
| 06 | Unit Testing |
| 07 | Tools for commissioning |
| **08** | **Package management** |


---

<header class="slide_header">
  <h2>Prerequisites</h2>
</header>

<div class="grid-two-col-eq">
<div class="flex-col justify-center">
  <p>Basic understanding of...
    <ul>
        <li>how to work with AX Code</li>
        <li>what a package and a package manager is</li>
        <li>programming wit ST</li>
        <li>unit testing in AX</li>
    </ul>
  </p>
</div>
</div>

---

<header class="slide_header">
<h2>What will you learn in this chapter</h2>
</header>

<div class="grid-two-col-eq">
<div class="flex-col justify-center">
  <p>Basic understanding of...
    <ul>
        <li>theory behind libraries</li>
        <li>creation of packages</li>
        <li>consumption of packages</li>
    </ul>
  </p>
</div>
  <img src="./img/target.png" height=250 width=auto/>
</div>

---

<header class="slide_header">
<h2>What are libraries?</h2>
</header>


<div class="flex-col justify-center">
  <p>
    The single biggest way to improve both the quality of your code and your productivity is to <b>reuse</b> good code. Many algorithms have already been invented, tested, reviewed, and improved.
  </p>
  <br>
  <br>
  <p>
    Functionality can be shared in libraries among multiple applications to avoid code redundancy and <b>maintain</b> code standards and quality. Libraries are being consumed <b>read-only</b>.
  </p>
</div>


----

<header class="slide_header">
<h2>How do libraries look like in AX?</h2>
</header>

<div class="grid-two-col-eq">
<div class="flex-col justify-center">
  <p>
    AX libraries can be distributed as source code libraries or as binary (precompiled) libraries. The source code of binary libraries can´t be inspected by a consumer.
  </p>
  <br>
  <p>
    In a project, you can reference a specific version or the latest version of a library. You can even bump and rollback a version. How this is done, is described in later slides.
  </p>
  <br>
  <p>
    Both application projects and library projects can reference several libraries.
  </p>
</div>
  <img src="./img/library.jpg" height=500 width=auto/>
</div>

----

<header class="slide_header">
<h2>How do libraries look like in AX?</h2>
</header>


<div>
  <p>
    In AX, a library can consist of:
  </p>
  <ul>
      <li>ST functions</li>
      <li>ST function blocks</li>
      <li>ST classes</li>
      <li>ST type definitions</li>
  </ul>
  <br>
  <p>
    So a library cannot contain a <code>CONFIGURATION</code>, a <code>PROGRAM</code> or a global variable.
  </p>
</div>



---

<header class="slide_header">
<h2>Creating own libraries</h2>
</header>

<div class="grid-two-col-eq">
<div class="flex-col justify-center">
  <p>
    You should cut functionality into meaningful partitions and create smaller libraries instead of a single big bouquet. Your code should be designed so that it can be reused.
  </p>
  <br>
  <p>
    A library does not contain any project-specific or global data.
  </p>
</div>
<img src="./img/cake.jpg" height=400 width=auto/>
</div>

----

<header class="slide_header">
<h2>Setting up a new library project</h2>
</header>

<div class="grid-two-col-eq">
<div class="flex-col justify-center">
  <p>
    To create a new library project you can select the <code>@ax/lib</code> template in the project creation or run <code>apax create lib</code> in a terminal.
  </p>
</div>
<img src="./img/create_lib_project.png" height=400 width=auto/>
</div>

----

<header class="slide_header">
<h2>Defining the namespace</h2>
</header>

<div class="grid-two-col-eq">
<div class="flex-col justify-center">
  <p>
    A library is a way to modularize software, hence it should describe its provided functionality semantically. Namespaces are a good means to do so.
  </p>
  <br>
  <p>
    It is not possible to have a library without a namespace, nor a library with more than <b>one top-level namespace</b>. Underneath the top-level namespace it can have an arbitrary amount of child namespaces.
  </p>
</div>
</div>

----

<header class="slide_header">
<h2>Defining the namespace</h2>
</header>

>
<div class="flex-col justify-center">
  <p>
    A typical convention for namespaces is:
  </p>
  <br>
  <pre>&lt; Company&gt;.( &lt; Product &gt;| &lt; Technology &gt; )[. &lt; Feature &gt; ][. &lt; Subnamespace &gt; ]</pre>
  <br>
<p>
  Example for a ST file:
</p>
<br>
<pre>
  NAMESPACE Siemens.Training.Fluidhandling
  // ...
  END_NAMESPACE
</pre>
</div>
<br>
<br>
<div class="grid-slide-ressources">
  <ol>
    <li>namespace convention <br><a href="https://docs.microsoft.com/de-de/dotnet/standard/design-guidelines/names-of-namespaces">"https://docs.microsoft.com/de-de/dotnet/standard/design-guidelines/names-of-namespaces"</a></li>
  </ol>
</div>


----

<header class="slide_header">
<h2>Coupling and encapsulation</h2>
</header>


<div class="flex-col justify-center">
  <p>
    Encapsulation is the hiding of internal details from the user. Libraries need to hide the details, even if this hiding conflicts with the user's desire to reuse library code.
  </p>
  <br>
  <p>
    To resolve this issue, object-orientated programming gives you the <code>FINAL</code> class keyword forbidding inheritance and the <code>PRIVATE</code>, <code>PROTECTED</code>, <code>INTERNAL</code>, and <code>PUBLIC</code> access modifiers for classes, interfaces and methods. To find out more about these mechanisms check out the chapter "OOP in ST".
  </p>
  <br>
  <p>
    Additionally, using interfaces for decoupling concrete classes (e. g. for input/output data) is a very common thing. This allows the users to implement their own classes – and makes code more testable.
  </p>
</div>

---

<header class="slide_header">
<h2>Testing a library</h2>
</header>


<div class="flex-col justify-center">
  <p>
    You should write tests for your library, e. g. unit tests and integration tests. The tests are stored next to your ST sources.
  </p>
  <br>
<p>
  To run the tests in your library project, you call:
</p>
<br>
<pre>
  apax build
  apax test
</pre>
<br><br><br><br><br>
<p>
<b>Hint:</b> There is an exercise about creating and testing a library included in this chapter (exercise 1).
</p>
</div>

----

<header class="slide_header">
<h2>Testing a library</h2>
</header>


<div>
  <p>
    The tests are typically not part of a published library, see chapter "Packing and publishing a library".
  </p>
  <p>
    A typical AX library structure looks like this:
  </p>
  <br>
  <pre>
    ax-showcase-fluidhandling/
    ├── .apax/           // Not under version control
    ├── doc/
    │   └── belt.md
    ├── src/
    │   └── belt.st
    ├── bin/             // Not under version control
    ├── test/
    │   └── beltTests.st
    ├── testResults/     // Not under version control
    ├── apax.yml
    ├── apax-lock.json
    ├── LICENSE.md
    ├── README.md
    ├── .gitattributes
    └── .gitignore
  </pre>
</div>

---

<header class="slide_header">
<h2>Including files in the library</h2>
</header>

<div class="flex-col justify-center">
  <p>
    The preferred way for producing a library is to use the APAX package manager. In the <code>apax.yml</code> file, you specify via the <code>files</code> section which files will be included in the published library.
  </p>
  <br>
<p>
  Example for a <code>apax.yml</code> file:
</p>
<br>
<pre>
  name: '@ax-showcase/fluidhandling'
  version: 0.0.1
  author: Siemens AG
  keywords:
    - library
  type: lib           # new: library type
  targets:
    - "1500"
    - llvm
  variables:
    APAX_BUILD_ARGS:
      - "--debug"     # Generate debug information for target "1500"
  dependencies:
    "@ax/system-timer": ^7.0.17
  devDependencies:
    "@ax/sdk": 2405.0.0
  registries:
    '@ax-showcase': 'https://npm.pkg.github.com'
  files:             # new: define which files are included in the published library
    - 'README.md'
    - 'LICENSE.md'
    - 'doc'
    - 'src'          # either publish library with source code
    # - 'bin/1500'   # or publish library with binary only
</pre>
</div>

----

<header class="slide_header">
<h2>Semantic versioning</h2>
</header>

<div class="flex-col justify-center">
  <p>
    The version number of a library must be a valid semantic version. Semantic versioning consists of three numbers seperated by a dot:
  </p>
  <ul>
      <li>First digit: major version &rarr; indicates breaking change (no backwards compatibility)</li>
      <li>Second digit: minor version &rarr;  added functionality in a backward compatible manner</li>
      <li>Third digit: patch version &rarr; backward compatible bug fixes</li>
  </ul>
  <br>
  <pre>
    1.2.1
    &uarr; &uarr; &uarr;
    | | patch
    | minor
    major
  </pre>
  <p>

  </p>
  <br>
  <div class="grid-slide-ressources">
    <ol>
      <li>semantic versioning: <br><a href="https://semver.org/">"https://semver.org/"</a></li>
    </ol>
  </div>
</div>

---

<header class="slide_header">
<h2>Packing and publishing a library</h2>
</header>

<div class="flex-col justify-center">
  <p>
    When the library is ready and you want to publish it, proceed as follows: Before packing, ensure that you set a new version for the package. Then create an APAX package that contains the library elements. It will automatically be named <code>&lt; projectname &gt;-&lt; version &gt;.apax.tgz</code>. The name and version will be the same as the ones defined in the <code>apax.yml</code>.
  </p>
  <p>
    The package can then be published on an internal or public package registry, such as the GitLab Package Registry or GitHub Packages. Ensure, that you are logged into the corresponding registry.
  </p>
  <br>
  <pre>
  apax version 1.0.4
  apax pack
  apax login --registry https://npm.pkg.github.com --password *
  apax publish --package *.apax.tgz --registry https://npm.pkg.github.com
  </pre>
  <br><br><br><br>
  <div class="grid-two-col-eq">
    <div class="flex-col justify-center">
    <p>
    <b>Hint:</b> There is an exercise about publishing a library included in this chapter (exercise 2).
    </p>
    </div>
      <img src="./img/box.png" height=120 width=180/>
  </div>
</div>

---

<header class="slide_header">
<h2>Consuming libraries</h2>
</header>


<div class="flex-col justify-center">
  <p>
    If not already done, you must add your package registry to your <code>apax.yml</code> file manually beforehand:
  </p>
  <br>
  <pre>
  # ...
  registries:
  '@ax-showcase': 'https://npm.pkg.github.com'
  # ...
  </pre>
  <br>
  <p>
  To consume a library, you add a reference to the library package in your project. For example:
  </p>
  <br>
  <pre>
  apax add @ax-showcase/io
  </pre>
  <p>
  or installing a specific version:
  </p>
  <br>
  <pre>
  apax add @ax-showcase/io@5.0.0
  </pre>
  <br>
  <p>
  Additionally, an initial login to the package registry may be necessary:
  </p>
  <br>
  <pre>
  apax login --registry https://npm.pkg.github.com --password "F1eeC0ffee"
  </pre>
</div>

----

<header class="slide_header">
<h2>Consuming a specific version</h2>
</header>


<div class="flex-col justify-center">
  <p>
    A version can either be specified exactly or with range arguments in the <code>apax.yml</code>:
  </p>
  <ul>
      <li><code>1.4.5</code> - Matches exactly this version. No alternative will be used.</li>
      <li><code>^1.4.5</code> - Matches any version that is equal to or larger than 1.4.5 but below 2.0.0.</li>
      <li><code>~1.4.5</code> - Matches any version that is equal to or larger than 1.4.5 but below 1.5.0.</li>
  </ul>
</div>
<br><br><br><br>
<p>
    <b>Hint:</b> There is an exercise about consuming a library included in this chapter (exercise 3).
</p>
<br>
<br>
<div class="grid-slide-ressources">
  <ol>
    <li>apax dependencies: <br><a href="https://console.simatic-ax.siemens.io/docs/apax/yml#dependencies">"https://console.simatic-ax.siemens.io/docs/apax/yml#dependencies"</a></li>
    <li>apax cheat sheet: <br><a href="https://console.simatic-ax.siemens.io/docs/apax/yml#dependencies">"https://github.com/simatic-ax/apax-cheat-sheet"</a></li>
  </ol>
</div>
<https://github.com/simatic-ax/apax-cheat-sheet>

---

<header class="slide_header">
<h2>In this section you learned...</h2>
</header>

<div class="flex-col justify-center">
  <ul>
        <li>about advantages of libraries.</li>
        <li>how to create a library.</li>
        <li>how to publish a library.</a></li>
        <li>how to consume a library.</li>
    </ul>
</div>
