### Steps to Run the App

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
I prioritized the UI because the data parsing was easy to do with system APIs, iamge caching was available through Kingfisher, and so this app will distinguish itself through a better UI experience.

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?
Roughly five hours. Majority of it was setting up the UI and trying to tweak it to look the way I wanted it.

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
1. Unit tests should not have external dependencies, but due to time constraints and because this is a simple project that is not gettign deployed into production I decided to leave it connected to the external server URL.
2. I chose to do this in SwiftUI so it can work on iPad and function properly on rotation without having to worry about size classes and layout constraints directly. 
3. My error messages are defined directly in the RecipeFetcher class for simplicity and are not localized. In a real production app I would have a separate class to better handle error generation and would localize the messages into something useful for the user.

### Weakest Part of the Project: What do you think is the weakest part of your project?

### External Code and Dependencies: Did you use any external code, libraries, or dependencies?

I used the Kingfisher library for the following reasons:
1. While caching images is not a super-complex problem, it is not the core focus of the app or assignment and as such was not something to spend time on.
2. Kingfisher library supports Swift and SwiftUI, is actively maintained, has the appropriate licensing(MIT license).
3. Kingfisher is used extensively by many developers, which means key bugs have already been worked out.
4. According to their GitHub documentation, they are fully ready for Swift 6.

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
