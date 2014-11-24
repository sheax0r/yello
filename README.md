# Yello

This CLI enables the import/export of Trello boards to and from YAML files.

## Installation

```bash
gem install yello
```

## Configuration
You will need to obtain a Trello API key and token. The CLI will 
walk you through this process if you run this:
```bash
yello login
```
Credentials will be stored in your [netrc file](http://www.gnu.org/software/inetutils/manual/html_node/The-_002enetrc-File.html).
If you encrypt this file with GPG, your Trello credentials will also be encrypted.
This functionality is brought to you courtesy of the [netrc gem](https://github.com/heroku/netrc)

## Usage

Here is an example of the file format:
```yaml
Not Started:
  cards:
  - Get an email account
  - Have lunch with your manager
  - Get a key card
  - Attend the noob-101 workshop
    # Shorthand for a simple checklist
    checklist:
      - item 1
      - item 2
  - Submit your first bugfix:
    desc: You must fix a bug to prove your worth.
    # Long form for if you need multiple checklists or custom names.
    checklists:
    - Process:
      - Write tests
      - Write code
      - Get it reviewed
      - Merge it
In Progress: {} 
Completed: {} 
```

### Importing a file
Importing a file will create a new board in Trello with the name you specify..
```bash
# this ... 
yello import "my awesome board" --file /path/to/file.yml

# or this ... 
cat /path/to/file.yml | yello import "my awesome board" 
```

### Exporting a file
Exporting a board will generate yaml based on the given board from Trello.
At present, only board IDs are supported when exporting.

```bash
# this ... 
yello export --id TE7Kl7ua --file /path/to/file.yml

# or this ... 
yello export --id TE7Kl7ua > /path/to/file.yml
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/yello/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
