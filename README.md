<a name="readme-top"></a>

<!-- PROJECT SHIELDS -->
<!--
*** We are using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/christianschuler8989/DialectMapping">
    <img src="images/logo.png" alt="Logo" width="450" height="150">
  </a>

  <h3 align="center">DialectMapping</h3>

  <p align="center">
    Towards a Complete Interactive Mapping of Kurdish Dialectology
    <br />
    <a href="https://github.com/christianschuler8989/DialectMapping/tree/main/docs"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/christianschuler8989/DialectMapping">View Demo (TODO)</a>
    ·
    <a href="https://github.com/christianschuler8989/DialectMapping/issues">Report Bug</a>
    ·
    <a href="https://github.com/christianschuler8989/DialectMapping/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
      	<li><a href="#poster-presented-at-the-ickl-6-in-2023">ICKL-6 Poster</a></li>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

[![Project Name Screen Shot][project-screenshot]](https://github.com/Low-ResourceDialectology/DialectMapping)

This will be an interactive map for various dialects from low-resource languages, with a focus on and starting with Kurdish.

There exist a plathora of Kurdish dialects that are often unintelligible to the native speakers of each other. However, Kurdish is considered to be a dialect continuum with at times sudden language shifts and sometimes smooth transitions from one dialect to the neighboring one.
At first it might seem confusing and counter intuitive that it has been found, that Central Kurdish is considered to be very understandable by speakers of Northern Kurdish and Southern Kurdish to be understandable by speakers of Central Kurdish- but speakers of Northern Kurdish hardly being able to understand Southern Kurdish. An explanation for this can be found in the prior mentioned dialect continuum- where "Central Kurdish" is not necessarily "Central Kurdish", since there exist many differen subdialects of Central Kurdish.

[![Project Motivation Screen Shot][project-idea]](https://github.com/Low-ResourceDialectology/DialectMapping)

Utilizing an interactive map, visualizing the different aspects and geographical distribution of the separate dialects might enable new insights and at the very least an easier understanding of Kurdish linguistics.


<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Poster presented at the ICKL-6 in 2023

The International Conference on Kurdish Linguistics ([ICKL](https://www.uni-frankfurt.de/43529817/Aktuelles)) is a biannual conference serving as a forum of scientific exchange for linguists working on any aspect of Kurdish, including the interactions with its neighboring languages. 

[![Project Poster Screen Shot][project-poster-ickl-png]](https://github.com/Low-ResourceDialectology/DialectMapping)
[The poster as pdf](https://github.com/Low-ResourceDialectology/DialectMapping/blob/main/images/2023_ICKL_DialectMapping_Poster.pdf)


### Built With

List of major frameworks/libraries used to bootstrap this project.

* R

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

TODO

### Installation

TODO: More Details

- Install R
- Set library directory for R
```
echo 'export R_LIBS_USER="/media/CrazyProjects/LowResDialectology/DialectMapping/DialectMapping/R"' >> ~/.bashrc
source ~/.bashrc
```
- Install packages (via setup script)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

### Example: German
- 1. We assume German to be spoken in Germany and maybe in the surrounding countries, so we look on google maps (or more old-school: A real atlas) and write the country names into the DialectMapping/data/info/german_countries.txt file (line-by-line).
- 2. We run the bash script to convert our list of country names into country codes used by gadm and executable R-Code.
```
bash country_names2codes.sh
```
  - Found countries are written into: ./data/inter/german_countries_codes.txt
  - Missing countries are written into: ./data/inter/german_countries_not_found.txt
- (TODO: Link with DialectOntology to automate this part)
- 3. 


_For more examples, please refer to the [Documentation](https://github.com/christianschuler8989/DialectMapping/tree/main/docs)_

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

- [x] Set up this Repository
- [ ] Section 1: Dialect Information
    - [ ] Classification/Typology
        - [ ] (partially) Languege Family
        - [ ] (partially) (Sub-)Dialect(-Group)
        - [ ] Linguistic Information
    - [ ] (Meta) Data
        - [ ] (partially) Areas where spoken
        - [ ] Native Speaker
        - [ ] (partially) Link to Publications
- [ ] Section 2: Geolocation Data
    - [ ] Data Source(s)
        - [ ] Comfortable Access
        - [ ] Up to date
        - [ ] (partially) Proper Format
    - [ ] Preprocess and Aggregate
        - [ ] Normalize Naming
        - [ ] Link GeoData to Dialect Data
- [ ] Section 3: Interactive Map
    - [ ] Map Functionalities
        - [ ] (partially) R-Scripts and Packages
        - [ ] Accessible Visualisations
        - [ ] Stress-Testing
    - [ ] Online Hosting
        - [ ] Server Setup
        - [ ] Stress-Testing


See the TODO: [open issues](https://github.com/christianschuler8989/DialectMapping/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the Apache License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

[Christian Schuler](https://christianschuler8989.github.io/) - christianschuler8989(4T)gmail.com

[Raman Ahmad](https://github.com/RamanAhmad.github.io/) - raman.ahmad2022(4T)gmail.com

Related project of the authors: [Analysis of Phonology and Morphology in the Kobani Dialect ](https://github.com/Low-ResourceDialectology/KobaniAnalysis)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

A list of helpful resources we would like to give credit to:

* [Best-README-Template](https://github.com/othneildrew/Best-README-Template) 
* [GADM](https://gadm.org/index.html) provides maps and spatial data for all countries and their sub-divisions. You can browse our maps or download the data to make your own maps.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/christianschuler8989/DialectMapping.svg?style=for-the-badge
[contributors-url]: https://github.com/christianschuler8989/DialectMapping/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/christianschuler8989/DialectMapping.svg?style=for-the-badge
[forks-url]: https://github.com/christianschuler8989/DialectMapping/network/members
[stars-shield]: https://img.shields.io/github/stars/christianschuler8989/DialectMapping.svg?style=for-the-badge
[stars-url]: https://github.com/christianschuler8989/DialectMapping/stargazers
[issues-shield]: https://img.shields.io/github/issues/christianschuler8989/DialectMapping.svg?style=for-the-badge
[issues-url]: https://github.com/christianschuler8989/DialectMapping/issues
[license-shield]: https://img.shields.io/github/license/christianschuler8989/DialectMapping.svg?style=for-the-badge
[license-url]: https://github.com/christianschuler8989/DialectMapping/blob/main/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/christian-schuler-59090a177/
[project-screenshot]: images/DialectMapping-Concept.png
[project-idea]: images/Kurdish-PercievedLanguageSimilarity.png
[project-poster-ickl-png]: images/2023_ICKL_DialectMapping_Poster.png
[project-poster-ickl-pdf]: images/2023_ICKL_DialectMapping_Poster.pdf

