<!-- If this is a Nuget package -->
<!-- [![NuGet Downloads][nuget-shield]][nuget-url] -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

# ![Logo][Logo] Increase build number

<!-- If there is screenshots -->
<!-- ![Screenshot1][screenshot1-url] -->

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
    - [Clone the repo](#clone-the-repo)
- [Usage](#usage)
  - [Notes](#notes)
- [Contributing](#contributing)
- [Bug / Issue Reporting](#bug--issue-reporting)
- [License](#license)
- [Contact](#contact)
- [Acknowledgments](#acknowledgments)

## Overview
Increase build number in Visual studio project file.

## Features
- **Automatic Build Number Increment**: Automatically increments the build number in the `<VersionPrefix>` element of your `.csproj` file.
- **Version Validation**: Ensures the version follows the `Major.Minor.Build` format (e.g., `0.1.0`) before incrementing.
- **Default Path Handling**: Automatically determines the project file path if not explicitly provided.
- **Error Handling**: Provides detailed error messages for missing or invalid project files and version formats.
- **Git Integration**: Automatically stages and commits the updated project file with a descriptive commit message.
- **Customizable Parameters**: Allows specifying the project file path and organization name as parameters.

## Getting Started

### Prerequisites
- Dotnet 9.0 or later

### Installation

#### Clone the repo
![Repo size][repos-size-shield]

```bash
git clone https://github.com/TirsvadCLI/PS.IncreaseBuildNumberVSProject.git
```

## Usage
To use this tool to increase the build number in your Visual Studio project file, follow these steps:

1. **Ensure the Project File is Configured**  
   Make sure your `.csproj` file contains the following line in the `<PropertyGroup>` section:
   ```xml
   <PropertyGroup>
     <VersionPrefix>0.1.0</VersionPrefix>
   </PropertyGroup>
   ```

2. **Run the Tool**  
   Execute the tool to automatically increment the build number. Use the following command:
   
       dotnet run --project <PathToYourProjectFile>

   Replace `<PathToYourProjectFile>` with the path to your `.csproj` file.

3. **Verify the Changes**  
   Open your `.csproj` file and confirm that the build number has been incremented in the `VersionPrefix` or `Version` property.

### Notes
- Ensure you have .NET 9.0 or later installed.
- The tool modifies the project file directly, so it's recommended to commit your changes before running the tool to avoid accidental data loss.


## Contributing
Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Bug / Issue Reporting  
If you encounter a bug or have an issue to report, please follow these steps:  

1. **Go to the Issues Page**  
  Navigate to the [GitHub Issues page][githubIssue-url].  

2. **Click "New Issue"**  
  Click the green **"New Issue"** button to create a new issue.  

3. **Provide Details**  
  - **Title**: Write a concise and descriptive title for the issue.  
  - **Description**: Include the following details:  
    - Steps to reproduce the issue.  
    - Expected behavior.  
    - Actual behavior.  
    - Environment details (e.g., OS, .NET version, etc.).  
  - **Attachments**: Add screenshots, logs, or any other relevant files if applicable.  

4. **Submit the Issue**  
  Once all details are filled in, click **"Submit new issue"** to report it.  

## License
Distributed under the GPL-3.0 [License][license-url].

## Contact
Jens Tirsvad Nielsen - [LinkedIn][linkedin-url]

## Acknowledgments

<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/TirsvadCLI/PS.IncreaseBuildNumberVSProject?style=for-the-badge
[contributors-url]: https://github.com/TirsvadCLI/PS.IncreaseBuildNumberVSProject/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/TirsvadCLI/PS.IncreaseBuildNumberVSProject?style=for-the-badge
[forks-url]: https://github.com/TirsvadCLI/PS.IncreaseBuildNumberVSProject/network/members
[stars-shield]: https://img.shields.io/github/stars/TirsvadCLI/PS.IncreaseBuildNumberVSProject?style=for-the-badge
[stars-url]: https://github.com/TirsvadCLI/PS.IncreaseBuildNumberVSProject/stargazers
[issues-shield]: https://img.shields.io/github/issues/TirsvadCLI/PS.IncreaseBuildNumberVSProject?style=for-the-badge
[issues-url]: https://github.com/TirsvadCLI/PS.IncreaseBuildNumberVSProject/issues
[license-shield]: https://img.shields.io/github/license/TirsvadCLI/PS.IncreaseBuildNumberVSProject?style=for-the-badge
[license-url]: https://github.com/TirsvadCLI/PS.IncreaseBuildNumberVSProject/blob/master/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/jens-tirsvad-nielsen-13b795b9/
[githubIssue-url]: https://github.com/TirsvadCLI/PS.IncreaseBuildNumberVSProject/issues/
[repos-size-shield]: https://img.shields.io/github/repo-size/TirsvadCLI/PS.IncreaseBuildNumberVSProject?style=for-the-badg

[logo]: https://raw.githubusercontent.com/TirsvadCLI/PS.IncreaseBuildNumberVSProject/main/image/logo/32x32/logo.png
