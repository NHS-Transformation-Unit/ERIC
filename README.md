<img src="images/TU_logo_large.png" alt="TU logo" width="200" align="right"/>

# Estates Returns Information Collection (ERIC)
This repository contains the scripts to download, process and analyse the 2022/23 [ERIC publication](https://digital.nhs.uk/data-and-information/publications/statistical/estates-returns-information-collection/england-2022-23) from NHS Digital. 

<br/>

## Using the Repo
To recreate the visuals within this repository, clone the repo and run the scripts in the following order:
`packages.R` in the `requirements` folder
`load.R` in the `processing` folder
`cleansing.R` in the `processing` folder
`processing.R` in the `processing` folder
`palette.R` in the `config` folder
`visualising.R` in the `visualisations` folder
`ERIC Markdown.Rmd` in the main folder

The section below shows the structure of the repository to explain the code used. All data is publicly available from NHS Digital.

<br>

## Repo Structure

At present the structure of the repository is:

``` plaintext

├───data
    └───lookups
├───images
└───src
    ├───config
    ├───outputs
    ├───processing
    ├───requirements
    └───visualisation
    
```

<br/>

### `data`
Where the extract of ERIC data will be saved for loading and processing.

### `images`

Images such as TU logos and branding to add to outputs.

### `src`

All code is stored in src. This is subdivided into five modules:

1. `config`: Files for configuring the output such as the `theme.css`.
2. `data`: External datasets providing look-ups of NHS Trust and Sites to their geographical locations.
3. `processing`: Files for downloading and processing the ERIC data.
4. `requirements`: Requirements file for building the output html such as the `packages.R` script.
5. `visualisation`: Files for producing the visualisations used within the outputs.

## Contributors

This repository has been created and developed by:

-   [Andy Wilson](https://github.com/ASW-Analyst)
-   [Simon Wickham](https://github.com/SiWickham)