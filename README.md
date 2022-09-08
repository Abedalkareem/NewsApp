<p align="center">
<img src="https://raw.githubusercontent.com/Abedalkareem/NewsApp/master/logo.png">  </center>
</p>  

News app, an app to list news and it's details. The app support two languages, Arabic and English.

## Screenshots

<table>
  <tbody>
    <tr>
      <th><img src="https://raw.githubusercontent.com/Abedalkareem/NewsApp/master/screen1.png"/></th>
      <th><img src="https://raw.githubusercontent.com/Abedalkareem/NewsApp/master/screen2.png"/></th>
      <th><img src="https://raw.githubusercontent.com/Abedalkareem/NewsApp/master/screen3.png"/></th>
      <th><img src="https://raw.githubusercontent.com/Abedalkareem/NewsApp/master/screen4.png"/></th>
    </tr>
  </tbody>
</table>

## How to get up and runing

- Clone the app.
- Run the app 🚀.

## Architecture  

The project uses MVVM architecture with coordinator. To observe to data changes from the view model, an `Observable` class has been created.  
The project has two targets:  
- NewsApp: A target for the iOS app.
- Shared: A target that has all the components that can be shared between multiple platforms.

## Dependencies

- SDWebImage.
- AMProgressHUD.
- SwiftLint.
- LanguageManager-iOS. 
- Quick. 
- Nimble. 

## License

``` Text
The MIT License (MIT)

Copyright (c) 2019 Abedalkareem

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
