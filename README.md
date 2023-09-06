# payiotest

Test task for Payio

### Update: 
Added CI CD and Email notifications with new build APK

## Features
- [x] Refactor the application to the best understanding of the design pattern.

 All layers of Clean Architecture have been implemented.
- [x] Fix the loading state and fetching data feature. 

Implemented all loading states.
- [x] Find and fix all other bugs and issues.

 The application works well*.
- [x] Add more information about characters.

 Added a few more fields (image, gender).
- [x] Optimize scrolling performance. 

Scrolling works well now, with transition state delay to prevent server spam.
- [x] Implement pagination.

 Done.

## Optional Features:
- [x] Add infinite scrolling pagination.

 Done.
- [x] Implement recovering from an `Error` state after the last request failed in the paginated view.

 Done. 
- [x] Account for all possible states and edge cases.

 Done.

## Important 
One problem is that I can't manage. I don't have a physical device for testing iPhone behavior. In the simulator, I always got a network error.
That's because I used a plugin for checking internet activity. The plugin always returns false for the `isConnected` function on iOS.

I tried to change two plugins, and I encountered the same error. Also, I suspect it might be a trap set by the task creator, similar to what happened with the Android Manifest. However, I also attempted to create a project from scratch, but the result remained the same. 
I'm quite sure that if you test it on a real device, you won't be able to reproduce that bug. Nevertheless, I decided to let you know.



iOS 

<img width="746" alt="Screenshot 2023-08-31 at 18 34 32" src="https://github.com/opimand/payiotest/assets/22457340/aa70bacc-5eb5-4d67-b738-acf1598b5d2f">

Android

<img width="824" alt="Screenshot 2023-08-31 at 18 38 54" src="https://github.com/opimand/payiotest/assets/22457340/d8b27a67-6d23-4274-a2a1-496dcacff7c3">
