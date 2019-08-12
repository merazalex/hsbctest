MyCV app
This app is a CV app prototype that shows the CV of a main user, showing key points like career summary, past projects, skills and contact info.

The project was build  using:

Xcode 10.1 and Swift 4.2

MVVM+Coordinators
Although the project is a small app, I decided to use MVVM+Coordinators to left the architecture of the app ready to be scaled later on and grow the project with more modules.

I decided to use programmatic auto layout in order to avoid depending on storyboards, this gives the development process the freedom to manage the ui and the reusability of some components.

I create a builder for the labels and images to avoid repeating the code to create every ui element in the project, this saves development time and gives the developer the possibility of set default ui elements.

I also include the unit test cases for the main view model with some test scenarios that test the service, like if the request to get the main user was executed or not, and if the model is catching the right error when the service fail to get the information. I also included some UITest to check if the info was loaded correctly.

I implemented localization, although I only support English right now, but the app is ready to start implementing another language.

I created extensions for the table view cell reusability, one extension to download images asynchronously, extension to manage auto layout and extension to manage localization. This extensions will be useful in future projects to save time.

I included a network manager based on different classes (a Request builder an Operation Handler and a Request Parser) to separate the concerns as much as possible. This manager can also be reused later on in future projects and give the developer the possibility to just worry in creating different requests depending on the API of usage.