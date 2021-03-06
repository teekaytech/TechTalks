# Lifestyle Articles (Theme: TechTalks Platform)

> This is my Ruby on Rails capstone project at microverse. It is a platform for posting tech-related articles. Users can register/sign-in, create new article(s), read and vote for existing articles. The full project specifications are specified [here](https://www.notion.so/Lifestyle-articles-b82a5f10122b4cec924cd5d4a6cf7561).

![screenshot](/app/assets/images/screenshot.png)

## Built With

- Ruby v2.7.1
- Ruby on Rails v6.0.3
- Rspec / Capybara
- PGSQL
- AWS S3 Storage
- Bootstrap
- Heroku
- Rails Omniauth Gem

## Live Demo
[TeckTalks!](https://vast-citadel-76441.herokuapp.com/)


## Getting Started

To get a local copy up and running follow these simple example steps.
- On the project GitHub page, navigate to the main page of the repository [this page](https://github.com/teekaytech/TechTalks).
- Under the repository name, locate and click on a green button named `Code`. 
- Copy the project URL as displayed.
- If you're running Windows Operating System, open your command prompt. On Linux, Open your terminal.
- Change the current working directory to the location where you want the cloned directory to be made. Leave as it is if the current location is where you want the project to be.
- Type `git clone`, and then paste the URL you copied in Step 3.<br>
`$ git clone https://github.com/teekaytech/TechTalks`
- Press Enter. Your local copy will be created.

Please Note that you must have github installed on your PC, this can be done [here](https://gist.github.com/derhuerst/1b15ff4652a867391f03).

### Prerequisites

Ruby: 2.7.1
Rails: 6.0.3
Postgres: >=9.5

### Setup

Instal gems with:

```
bundle install
```

Setup database with:

```
   rails db:create && rails db:migrate && rails db:seed
```

### Settng up AWS Access Key
To setup AWS access keys and other resources for file upload storage, follow [these instructions](http://blog.thefirehoseproject.com/posts/switching-carrierwave-to-use-s3-with-heroku-and-localhost/) to:
- Open an account on AWS and create S3 bucket storage
- Create a new user and get the keys/credentials
- Setup the credentials to get started


### Setting up Omniauth Gem (Twitter & Google)
Kindly follow the step-by-step instructions on how to setup authentication with third party apps (Twitter, Google) on [Omniauth Gem official documentation page](https://github.com/zquestz/omniauth-google-oauth2)

### Usage

Start server with:
`rails server`

Open `http://localhost:3000/` in your browser.

### Run tests
Navigate to the project root directory and type:
```
    rpsec --format documentation
```


### Video Demo

[TechTalks](https://www.loom.com/share/7a118a3a1cc84674ae106f9eeed48bb2)

## Author

👤 **Taofeek Olalere**

- Github: [@teekaytech](https://github.com/teekaytech)
- Twitter: [@ola_lere](https://twitter.com/ola_lere)
- Linkedin: [olaleretaofeek](https://linkedin.com/in/olaleretaofeek)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Microverse](https://.microverse.org/)
- [Design Idea by Nelson Sakwa on Behance](https://www.behance.net/gallery/14554909/liFEsTlye-Mobile-version)
- [Full project specification](https://www.notion.so/Lifestyle-articles-b82a5f10122b4cec924cd5d4a6cf7561)
- [Switching CarrierWave to use S3 with Heroku and localhost](http://blog.thefirehoseproject.com/posts/switching-carrierwave-to-use-s3-with-heroku-and-localhost/)

## 📝 License

This project is [MIT](lic.url) licensed.