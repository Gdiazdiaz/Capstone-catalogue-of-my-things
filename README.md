<a name="readme-top"></a>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ](#faq)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 [Catalogue-of-my-things] <a name="about-project"></a>

**[Catalogue-of-my-things]** it is an application that allows the user to add items such as games, books, and music albums to the catalogue. It also allows to list them and save them in json files

## 🛠 Built With <a name="built-with"></a>

- Ruby
- VisualCode

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Ruby</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **[can_be_archived?()]**
- **[add_item]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

#### Select your platform
 - MacOS
 - Ubuntu
 - Windows

### Tools on Unix based systems

There are several tools that can be used to install Ruby on your local machine. The most popular are:
```sh
   rbenv
   RVM
   asdf
```
We will go with rbenv because it does not override any of the system shell scripts like RVM and it allows us to compile older Ruby versions that will fail with RVM.

## MacOS

Run the following commands in your terminal:
```sh
brew install rbenv ruby-build
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
source ~/.bash_profile
rbenv install 3.0.1
rbenv global 3.0.1
ruby -v
```
> Note: If you are using a shell other than bash, for example zsh, you should change the first line to use zshrc like this:
```sh
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.zshrc
```
> or any other config file of your shell.

## Ubuntu

> You can install Ruby on Ubuntu in several ways. The easiest way is to run the following command (source):
```sh
  sudo apt-get install ruby-full
```
If that doesn't work, you can try installing Ruby using [rbenv](https://github.com/rbenv/rbenv). This is a version manager tool for the Ruby programming language on Unix-like systems.

Run the following commands in your terminal:

```sh
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 3.0.1
rbenv global 3.0.1
ruby -v
```
consider checking [ Install ruby on Ubuntu 20.04 with rbenv.](https://linuxtut.com/install-ruby-on-ubuntu-20.04-with-rbenv-e419f/)

## Windows
Installing Ruby on Windows is a little more difficult than installing it on another OS. We would recommend using [WSL](https://learn.microsoft.com/en-us/windows/wsl/about), but you can also try to install Ruby directly on your OS with [rubyinstaller](https://rubyinstaller.org/).

```sh
WSL only works on 64-bit installations of Windows.
```

If you are using a 64-bit version of Windows 10, we recommend following [this](https://gorails.com/setup/windows/10) article to install Ruby.

If you can not use WSL then you should follow these steps:

> Download the last version of [RubyInstaller](https://rubyinstaller.org/downloads/).
> Run RubyInstaller and follow the steps described [here](https://stackify.com/install-ruby-on-windows-everything-you-need-to-get-going/).

## Setup database
### Ubuntu
- To install PostgreSQL, run the following command in the command prompt:
```sh
    sudo apt install postgresql
```
### PostgreSQL Apt Repository
- If the version included in your version of Ubuntu is not the one you want, you can use the  PostgreSQL Apt Repository. This repository will integrate with your normal systems and patch management, and provide automatic updates for all supported versions of PostgreSQL throughout the support lifetime of PostgreSQL.

- The PostgreSQL Apt Repository supports the current versions of Ubuntu:
> - kinetic (22.10, non-LTS)
> - jammy (22.04, LTS)
> - focal (20.04, LTS)
> - bionic (18.04, LTS)

on the following architectures:

> - amd64
> - arm64 (18.04 and newer; LTS releases only)
> - i386 (18.04 and older)
> - ppc64el (LTS releases only)

To use the apt repository, follow these steps:
```sh
    sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    sudo apt-get update
    sudo apt-get -y install postgresql
```
### Windows

- Follow the [this](https://www.postgresql.org/download/windows/) instructions to install postgresql on windows  
### Setup

Clone this repository to your desired folder:


```sh
  cd my-folder
  git clone git@github.com:Gdiazdiaz/Capstone-catalogue-of-my-things.gitt
```
### Install

Install this project with:


```sh
  cd Capstone-catalogue-of-my-things
  gem install
```

### Usage

To run the project, execute the following command:

```sh
  ruby main.rb
```
### Run tests

To run tests, run the following command:

```sh
  rspec spec
 ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Glenda Diaz**

- GitHub: [@Gdiazdiaz](https://github.com/Gdiazdiaz)
- LinkedIn: [Glenda Diaz](www.linkedin.com/in/glendadiazz)

👤 **Birhanu Gudisa**

- GitHub: [@GutemaG](https://github.com/GutemaG)
- Twitter: [@birhanugudisa3](https://twitter.com/birhanugudisa3)
- LinkedIn: [birhanugudisa](https://linkedin.com/in/birhanugudisa)

👤 **Belay Birhanu G**

- GitHub: [@githubhandle](https://github.com/belaymit)
- Twitter: [@twitterhandle](https://twitter.com/2belamit)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/belay-bgwa/)



<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] **[Use this code to create a web app]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Gdiazdiaz/Capstone-catalogue-of-my-things/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

If you like this project let us know by giving us a star ⭐️

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

We would like to thank all Microverse community

<!-- FAQ (optional) -->

## ❓ FAQ (OPTIONAL) <a name="faq"></a>
  - **What makes ruby the preferred for backend development?**
  - Ruby is preferred for backend development for several reasons:
    - **Expressiveness**: Ruby is a highly expressive language that allows developers to write code that is easy to read and understand. This makes it easier to maintain and update applications.
    - **Productivity**: Ruby has a vast collection of libraries and frameworks that make it easy to build web applications quickly. These tools allow developers to focus on building features instead of reinventing the wheel.
    - **Scalability**: Ruby has proven to be highly scalable over the years. Ruby-based applications can easily handle a large number of requests and traffic, making it an ideal language for building high-traffic web applications.
    - **Community support**: Ruby has a large and supportive community that provides extensive documentation, tutorials, and code samples. This makes it easier for developers to learn the language and solve problems when they arise.
    - **Agile development**: Ruby is highly compatible with Agile development methodologies, which emphasize flexibility and collaboration. This makes it easier to adapt to changing requirements and deliver high-quality software quickly.
  - **Why is the distinction between relational vs non-relational databases important?**
    - The distinction between relational and non-relational databases is important because they differ in their fundamental data storage and retrieval principles, as well as their suitability for different use cases.
    - Relational databases, as the name suggests, organize data in a table-like structure with rows and columns, where each row represents a unique record and each column represents a data field. This structure allows for easy data querying and retrieval through the use of Structured Query Language (SQL) and other relational database management systems (RDBMS). Relational databases are best suited for situations where data is well-structured, and relationships between data entities are clearly defined, such as in financial systems, inventory management, and customer relationship management.
    - On the other hand, non-relational databases, also known as NoSQL databases, use a variety of different data models to store and retrieve data, such as document-based, graph-based, or key-value pairs. Non-relational databases are more flexible than relational databases, allowing for greater scalability and performance, especially when dealing with large and unstructured data sets, such as those generated by social media platforms, IoT devices, and big data analytics.
    - Therefore, understanding the differences between these two types of databases is crucial in determining which type of database is most suitable for a particular application or use case, depending on factors such as data structure, scalability, performance, and ease of use.
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>