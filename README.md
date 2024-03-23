# Quick Maths


<section align="center">
  <img src="PreviewAssets/ScreenRecording1.gif" width="230" title="App Simulator Example">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="PreviewAssets/ScreenRecording2.gif" width="200"  title="Title">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="PreviewAssets/ScreenRecording3.gif" width="175"  title="Title">
</section>

### Overview:

A timed and adjustable arithmetic app that enhances numerical/mathematical proficiency and provides detailed post-game analysis. 


### Use Case:

Designed to enhance mathematical dexterity, users can choose from a variety of game types, each allowing for customisation of variables such as number range and frequency. 

This capability allows users to hone their skills in unique and interesting ways while receiving comprehensive post-game analysis to track progress and identify areas for improvement. 

A thorough statistics page offers users complete control over filtering variables, allowing them to tailor their analysis within specific parameters and display their results with intuitive graphical representations. 

Whether simply for enjoyment, for tracking and evaluating performance over time or for strengthening numerical proficiency, this app is a personalised and indispensable tool for individuals looking to promote mathematical fluency and independent learning.


<details open>
        <summary>Contents:</summary>
        <ul class="overview-section">
        <li><h3><a href="#future-plans">Future Plans</a></h3></li>
        <li><h3><a href="#current-difficulties">Current Difficulties</a></h3></li>
        <li><h3><a href="#past-problems">Past Problems</a></h3></li>
        <li><h3><a href="#screenshots">Screenshots</a></h3></li>
        <li><h3><a href="#licensing">Licensing</a></h3></li>
    </ul>
</details>
&nbsp;

# Project Progression


## Future Plans:

#### - <ins>Comprehensive Post-Game Analysis</ins>

#### - <ins>Preset Analysis Parameters</ins>


#### - <ins>Additional Customised Game Types</ins>

Flexibility would be ideal here, however figuring out how to incorporate variable logic at the level of individual questions and how to relate but also separate the post-gamne analysis within efficient means will need some consideration. This would be to ensure that current app structure is not greatly influenced and by doing so will also strengthen the app's structure and allow for the smooth implementation of future updates.




## Current Difficulties:

#### - <ins>Migrating Useful RawData Over Successive Versions</ins>

Ensuring that data is kept intelligible and usable over successive versions is extremely important - what's the point in a track app if it can no longer use archaic data? The address this I've tried to keep data in as raw a format as possible, as this enables more comprehensive analysis in the future and ensures that data can be utilised in whatever means possible despite current limitations. 

If required, version specific logic can be written to facilitate any large data structure changes. Code would need to be written to avoid crashes when new data fields are left blank, with analysis logic written in order to understand the different between *null* and *missing* values.



## Past Problems:


#### - <ins>Game UI hierarchy to support ObservableObjects</ins>

The game UI was tailored alongside the development of the **ObservableObjects** to ensure that data could be shared easily by all views that required it. 



#### - <ins>Hierarchy of Data Collection Objects</ins>

Deciding which elements to extract and which to keep specific took a number of iterations, how to group which various also took some consideration. Ultimately the approach was to consider which elements were shared across game types but also which variables were to likely to actually be used in other parts of the project. 


#### - <ins>Saving Complex Game Data in String Format with CoreData</ins>

It was decided that the simplest method of saving game data in an accessible format was to convert **Dictionaries** into **Strings**. Various methods were tested until the version currently seen, a complication was ensuring that each measured metric was comprehensible when retrieved independently but also combined easily with other variables. The various stages of this process were written and amalgamated into simple generic code that is utilised throughout the project, meaning that if the logic or the data structure itself changes, the majority of the project is not affected.



#### - <ins>Keyboard Text Input Logic</ins>

Each input **String** needed to be a handled differently depending on the game type. The input **String** need to operate as though it was a number, meaning that it needed to respond as would be expected of a calculator when using things such as a decimal places or minus numbers. This involved successive *if-else* statements unique to each game type to handle the starting condition and ensure that the input **String** was converted to the expected value in a format that could be understood by the mathematical game logic.  




# Screenshots



<section align="center">
  <img src="PreviewAssets/Screenshot4.png" width="200" title="Game View">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="PreviewAssets/Screenshot6.png" width="175"  title="Game Log Details">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="PreviewAssets/Screenshot9.png" width="150"  title="Statistics View">
</section>
<br>


<p align="center">
<img src="PreviewAssets/Screenshot2.png" width="150"  title="Game Setup">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="PreviewAssets/Screenshot4.png" width="175"  title="Game View">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="PreviewAssets/Screenshot5.png" width="200"  title="Save Game View">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p>
<br></br>




### Licensing

There is [no license](https://choosealicense.com/no-permission/) associated with this project other than usual GitHub [Terms of Service](https://docs.github.com/en/site-policy/github-terms/github-terms-of-service), however, please be mindful and acknowledge me as the original author if you use significant or distinct portions of this code.
