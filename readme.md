<h2> Screenshots
<br>
<img src="https://github.com/canyoldas0/GamesAPISearch/blob/develop/Readme/1.png?raw=true" width="175">
<img src="https://github.com/canyoldas0/GamesAPISearch/blob/develop/Readme/2.png?raw=true" width="175">
<img src="https://github.com/canyoldas0/GamesAPISearch/blob/develop/Readme/3.png?raw=true" width="175">
<img src="https://github.com/canyoldas0/GamesAPISearch/blob/develop/Readme/4.png?raw=true" width="175">
<img src="https://github.com/canyoldas0/GamesAPISearch/blob/develop/Readme/5.png?raw=true" width="175">
<img src="https://github.com/canyoldas0/GamesAPISearch/blob/develop/Readme/6.png?raw=true" width="175">

<h2> Documentation

<p>
<h4> 1.  How did you decide to use that design and architectural patterns? </h4>

I preferred MVVM pattern for this project. MVVM is very useful pattern because it gives you more flexibility with dependencies, and compared to other patterns, it is much faster to build on if you start from scratch.

<h4> 2. What should be the part of this app that needs more time to develop or improve? </h4>

<li> Error handling with generic alert structure would make this app much smoother.
<li> For search requests, filtering responses and showing more reliable data would make this app much reliable.
<li> Downloaded image sizes are high, there might be performance issues related to memory because of those image sizes.

<h4> 3. Which part did you like most in this app? </h4>
- I enjoyed developing the detail page where we have 2 different types of tableview cell, each has different use case, while making the page scrollable.
<h4> 4. Does this app ready to submit to store? If not, what should be done to achieve that? </h4>
<li> App is not ready to submit to store, because it doesn't have written tests yet.
<li> Backend response should be verified.
<li> UI transitions should be handled smoothly for better experience.
<h4> 5. Do you have any comments to us? </h4>
- There are some technical debts which couldn't be covered due to shortage of time.
<br>
<li> "Read More" button can be added to description label on detail page, for expanding the label.
<li> Some kind of network package is used rather than simply URLSession or Alomofire. Because, I think that there will be always a customized network package in real life projects, this one I used is something I'm familiar with. 
<li> I added another scheme and configuration just like asked in bonus points, however I haven't connected it to network manager.
<h4> 6. What are the things you think are missing or open in this assignment? </h4>
- I think that this case study covers lots of topics for iOS development and quite educational. The only thing missing is maybe it would be better to have UI designs for smaller screen sizes but overall it was fun.
