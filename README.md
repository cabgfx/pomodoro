# Pomodoro CLI

A simple command-line tool for calculating the number of Pomodoro sessions you can fit into a given time period. This script is designed to help you manage your time effectively by breaking it down into focused work sessions and breaks.

## Features

- Calculate the number of Pomodoro sessions for any given time range.
- Flexible configuration for Pomodoro duration, short breaks, and long breaks.
- Option to start from the current time and count forward by a specified number of hours.
- Ability to customize the number of Pomodoros per cycle.
- Easy-to-use command-line interface using the Thor gem.

## Installation

Ensure you have Ruby and the Thor gem installed on your system:

```bash
gem install thor
```

Clone this repository:

```bash
git clone https://github.com/cabgfx/pomodoro-cli.git
cd pomodoro-cli
```

Make the script executable:

```bash
chmod +x pomodoro.rb
```

## Usage

Run the script from the command line with the required parameters:

```bash
ruby pomodoro.rb pomo -s <start time> -e <end time> -d <pomodoro duration> -b <break duration> -l <long break duration> -c <pomodoros per cycle>
```

Alternatively, you can start from the current time and count forward by a specified number of hours:

```bash
ruby pomodoro.rb pomo -n <hours> -d <pomodoro duration> -b <break duration> -l <long break duration> -c <pomodoros per cycle>
```

### Options

- `-s`, `--start`: Start time in `HH:mm` format (24-hour clock, optional; defaults to current time when using `-e`)
- `-e`, `--end`: End time in `HH:mm` format (24-hour clock, required unless using `-n`)
- `-n`, `--now`: Number of hours from the current time (integer or float); takes priority over `-s` and `-e` (optional)
- `-d`, `--duration`: Duration of each Pomodoro in minutes (default: 20)
- `-b`, `--break`: Duration of each short break in minutes (default: 5)
- `-l`, `--longbreak`: Duration of each long break in minutes (default: 15)
- `-c`, `--cycles`: Number of Pomodoros per cycle (default: 4)

### Examples

1. **Start from specific times:**

   To calculate the number of Pomodoros you can fit between 14:11 and 23:19, with 18-minute Pomodoros, 3-minute short breaks, 22-minute long breaks, and 6 Pomodoros per cycle:

   ```bash
   ruby pomodoro.rb pomo -s 14:11 -e 23:19 -d 18 -b 3 -l 22 -c 6
   ```

**Output:**

```
Total time available: 242 minutes
Cycle details: 6 pomodoros per cycle, 22-minute long break
Calculation based on start time: 19:16 and end time: 23:19
Result: You can fit 10 pomodoros into your available time from 19:16 to 23:19.
```

2. **Start from now and count forward:**

   To start from the current time (19:18 in this example) and count 2.5 hours forward, using just the default values:

   ```bash
   ruby pomodoro.rb pomo -n 2.5
   ```

   or

   ```bash
   ruby pomodoro.rb pomo -e 21:48
   ```

**Output:**

```
Total time available: 150 minutes
Cycle details: 4 pomodoros per cycle, 15-minute long break
Calculation based on start time: 19:18 and end time: 21:48
Result: You can fit 5 pomodoros into your available time from 19:18 to 21:48.
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
