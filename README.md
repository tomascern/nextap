
  

# nextap homework

  

This is just a simple app for nextap interview (the task is [here](https://github.com/tomascern/nextap/raw/master/Resources/nextap_tech_task_ios-2.pdf)). App is intended for iPhones with deployment target 13.7. Only Portrait mode is supported.

  

## Installation

  

Just clone the repository and use [Cocoapods](https://cocoapods.org) to download project dependencies.

  

```bash

pod install

```

  

## Project description

  

This app uses VIPER architecture. It consists of two main modules: `Feed` and `Preview`.  The storyboards were used for designing user interface.

  

`Feed` loads data feed from the following endpoint:

> https://api.steller.co/v1/users/76794126980351029/stories

  

and parse the data into objects. The stories (just first images and user names) are then loaded into `UICollectionView`. After tap on any story (`UICollectionViewCell`), the preview shows up.

  

`Preview` module is instantiated from `Feed` module and prepopulated with all fetched stories (there is no reason to fetch it separately, as this module works with the same endpoint and no other data is needed).

  

Preview uses customized vertical UIScrollView for browsing stories. Each story consist of main `UIImageView` for the story image itself, and `UILabel` and `UIImageView` for user data. There is also button for dismissing the the `Preview`.  There are grey->opaque gradient layers at the top and bottom of the story image, the reason for this is to be able to read user name (which uses white font) on white or bright images.

  

After dismissing the `Preview`, stories `Feed` is scrolled to the position of the last browsed story.

  

## 3rd party libraries

This app uses following 3rd party libraries:

  

### VIPER Xcode Templates

I used this project to generate basic module structure for VIPER architecture. The repo is [here](https://github.com/infinum/iOS-VIPER-Xcode-Templates)

  

### SVProgressHUD

This is just progress indicator used when fetching stories.

[Source](https://github.com/SVProgressHUD/SVProgressHUD)

  

### Alamofire + AlamofireImage

Alamofire is used for fetching stories and loading images. [Repo](https://github.com/Alamofire/Alamofire)

  

### OHCubeView

Used for InstagramStories like transitions between Stories. This library was slightly modified, this version is [here](https://github.com/tomascern/ohcubeview)

  

## License

[MIT](https://choosealicense.com/licenses/mit/)
