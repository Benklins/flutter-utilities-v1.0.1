

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
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
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

### Flutter-utilities

This is a utilility package for flutter/dart is a clean and effient way to handle repetitive code that makes api requests, regardless of the network library used
it can be customised to suit your needs.

### Benefits
* Cleans code while making api requests.
* Api request error check is handled in one place.
* Efficiency 
* Predictable response and error.

### Built With

* Dart


<!-- GETTING STARTED -->
## Getting Started

To use this package

### Prerequisites

You don't need to install any package to use this

### Installation

1. Copy the link of project
   ```sh
   https://github.com/JasperEssien2/flutter-utilities.git
   ```
2. Add it to your pubspec.yaml file as a dependency
   ```sh
   flutter_utilities:
    git:
      url: https://github.com/JasperEssien2/flutter-utilities.git
      ref: master
   ```



<!-- USAGE EXAMPLES -->
## Usage

For now this library mainly focus on api request simplification.
The `lib\request_utility\dio_api_consuming_simplification.dart` simplifies api request using Dio network library.

Below contains a snippet of how this is being used

```
Future<SuccessResponse<MyResponseModel>> apiRequestFunction(
      double longitude, double latitude) async {
    String url = "https://my-api-url.com";

    return await DioApiConsumption.instance.simplifyApiRequest(
      () => helper.get(url),
      successResponse: (json) => SuccessResponse(
        MyResponseModel.fromJson(json),
      ),
    );
  }
```
This method is a usual method that makes an api request. It returns a `SuccessResponse` that encapsulates a custom `ResponseModel` of your choice, this `ResponseModel` is the model you'll like to return when an api request is successful.

This line `DioApiConsumption.instance.simplifyApiRequest()` is where the magic happens, as first parameter you pass in the request to be made can be any request function like a GET, POST, DELETE, PATCH. A successResponse, this is a function that returns the json returned by the api request. Please note a request that wasnt successful will throw an error.

An optional `bool useStatusCodeForSuccessCheck ` to use a status code for check if an api request was successful, if this is set to true it evaluates with the `statusCodeSuccess ` parameter.
if `useStatusCodeForSuccessCheck` is false, it evaluates using the json returned by the api response, a named param function has to be passed `dataSuccessValidator`, this is a function that passes the json as an argument and return a bool, that evaluates if api request was successful or not.

To handle error:

```
try {
      await _tryApiRequestFunction(0, 0);
    } on RequestFailedException catch (e) {
      ErrorResponse errorResponse = e.message;
      emit(state.error(errorResponse.errorMessage));
    } catch (e) {
      emit(state.error(e.toString()));
    }
  }
```

If this (`lib\request_utility\dio_api_consuming_simplification.dart`) doesn't suit your needs, you can customise this by implementing this abstract class
```
abstract class SimplifyApiConsumingBase<D, R, E> {}
```
Where `D` is the data type that will be returned by the network function.
`R` is the result of the api request you'll like returned
`E` is the error model that will be passed.

`parseErrorFromResponse()` will need to be implemented, the logic to pass error request from your json will be written here, and this returns the error model specified. 
<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/JasperEssien2/flutter-utilities/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Jahswill Essien - [@JasperEssien2](https://twitter.com/JasperEssien2) - jasperessien2@gmail.com

Project Link: [https://github.com/JasperEssien2/flutter-utilities/](https://github.com/JasperEssien2/flutter-utilities/)



<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* []()
* []()
* []()





<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/github_username/repo.svg?style=for-the-badge
[contributors-url]: https://github.com/github_username/repo/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/github_username/repo.svg?style=for-the-badge
[forks-url]: https://github.com/github_username/repo/network/members
[stars-shield]: https://img.shields.io/github/stars/github_username/repo.svg?style=for-the-badge
[stars-url]: https://github.com/github_username/repo/stargazers
[issues-shield]: https://img.shields.io/github/issues/github_username/repo.svg?style=for-the-badge
[issues-url]: https://github.com/github_username/repo/issues
[license-shield]: https://img.shields.io/github/license/github_username/repo.svg?style=for-the-badge
[license-url]: https://github.com/github_username/repo/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/github_username
