# Pomodoro CLI

A simple command-line tool for calculating the number of Pomodoro sessions you can fit into a given time period. This script is designed to help you manage your time effectively by breaking it down into focused work sessions and breaks.

## Features

- Calculate the number of Pomodoro sessions for any given time period.
- Flexible configuration for Pomodoro duration, short breaks, and long breaks.
- Easy-to-use command-line interface using the Thor gem.

## Installation

Ensure you have Ruby and the Thor gem installed on your system:

```bash
gem install thor
```

Clone this repository:

```bash
git clone https://github.com/<your-username>/pomodoro-cli.git
cd pomodoro-cli
```

Make the script executable:

```bash
chmod +x pomodoro.rb
```

## Usage

Run the script from the command line with the required parameters:

```bash
ruby pomodoro.rb pomo -s <start time> -e <end time> -d <pomodoro duration> -b <break duration> -l <long break duration>
```

### Options

- `-s`, `--start`: Start time in `HH:mm` format (required)
- `-e`, `--end`: End time in `HH:mm` format (required)
- `-d`, `--duration`: Duration of each Pomodoro in minutes (default: 20)
- `-b`, `--break`: Duration of each short break in minutes (default: 5)
- `-l`, `--longbreak`: Duration of each long break in minutes (default: 15)

### Example

To calculate the number of Pomodoros you can fit between 23:12 and 02:53, with 18-minute Pomodoros, 3-minute short breaks, and 15-minute long breaks:

```bash
ruby pomodoro.rb pomo -s 23:12 -e 02:53 -d 18 -b 3 -l 15
```

**Output:**

```
Total time available: 221 minutes
Cycle details: 3 pomodoros per cycle, 15-minute long break
Result: You can fit 9 pomodoros into your available time from 23:12 to 02:53.
```

## Contributing

Contributions are welcome! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes.
4. Commit your changes (`git commit -m 'Add new feature'`).
5. Push to the branch (`git push origin feature-branch`).
6. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

If you have any questions or suggestions, feel free to open an issue or reach out to me directly at [hi@cabgfx.com].

## Acknowledgments

- Built using Ruby and the Thor gem.
- Inspired by the Pomodoro Technique for time management.
