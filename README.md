# random-fiscal-code

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

**random-fiscal-code** is a Python program that allows you to generate random Italian fiscal codes from the command line.

## Features

- Generate random Italian fiscal codes.
- Generate random Italian fiscal codes and retrieve the data (gender, lastname, firstname, birthdate, birthplace) that generated it.
- Copy the generated fiscal code to the clipboard.

## Installation

Run this command in terminal:

   ```
   $ curl -L https://raw.githubusercontent.com/paologiua/random-fiscal-code/main/install.sh | bash
   ```

## Uninstallation

Run this command in terminal:

   ```
   $ curl -L https://raw.githubusercontent.com/paologiua/random-fiscal-code/main/uninstall.sh | bash
   ```

## Usage

To generate a random fiscal code, open a new terminal and use the following command:

```
$ random-fiscal-code
```

This will output a randomly generated fiscal code.

### Retrieve Data

To generate a random fiscal code and retrieve the data (gender, lastname, firstname, birthdate, birthplace) that generated it, use the `--extended` option:

```
$ random-fiscal-code --extended
```

### Copy to Clipboard

To generate a random fiscal code and copy it to the clipboard, use the `-copy` option:

```
$ random-fiscal-code -copy
```

This will copy the fiscal code to your clipboard, allowing you to paste it elsewhere.

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

## Contributing

Contributions are welcome! Please feel free to open issues or submit pull requests.

## Acknowledgements

This program uses the following libraries:

- [python-codicefiscale](https://pypi.org/project/python-codicefiscale/)
- [clipboard](https://pypi.org/project/clipboard/)
- [pandas](https://pandas.pydata.org/)

Thank you to the contributors of these projects.

## Disclaimer

This program generates random fiscal codes for testing and educational purposes only. It should not be used for any official or legal purposes. The generated fiscal codes may not correspond to real individuals or valid data. Use at your own risk.
