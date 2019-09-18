<h2>Koroibos</h2>

<p>Koroibos is Rails Api that serves endpoints related to the data found in a csv file with information about the 2</p>
016 Olympic Games. It is the final project in the Turing School backend curriculum.</p>

<h4>Ruby Version</h4>

<p>This application was built in Rails 5.2.3</p>

<h4>Application Setup</h4>

  - clone the repository
  - cd into the repository
  - run $ ``bundle`` from the command line
  - run $ ``rails db:create`` to create the database
  - run $ ``rails db:migrate`` to create a users table in the database
  - run $ ``rake import:prospect`` to import the Olympian csv data included in the repository
  - run $ ``rails s`` to spin up the server
  - to hit the endpoints append /api/v1/whatever endpoint you choose

<h4>Endpoints</h4>

  - ``GET api/v1/olympians`` will return a list of all Olympians in the dataset and the response is as follows.

```javascript
//Response Format
{
  "olympians":
    [
      {
        "name": "Maha Abdalsalam",
        "team": "Egypt",
        "age": 18,
        "sport": "Diving"
        "total_medals_won": 0
      },
      {
        "name": "Ahmad Abughaush",
        "team": "Jordan",
        "age": 20,
        "sport": "Taekwondo"
        "total_medals_won": 1
      },
      {...}
    ]
}
```

* `GET api/v1/olympians?age=youngest` will return the youngest Olympian competing in the 2016 Games

```javascript
//Response Format
{
  [
    {
      "name": "Ana Iulia Dascl",
      "team": "Romania",
      "age": 13,
      "sport": "Swimming"
      "total_medals_won": 0
    }
  ]
}
```

* `GET api/v1/olympians?age=oldest` will return the oldest Olympian competing in the 2016 Games

```javascript
//Response Format
{
  [
    {
      "name": "Julie Brougham",
      "team": "New Zealand",
      "age": 62,
      "sport": "Equestrianism"
      "total_medals_won": 0
    }
  ]
}
```

* `GET api/v1/olympian_stats` will return general statistical information about the 2016 Olympic games

```javascript
  {
    "olympian_stats": {
      "total_competing_olympians": 3120
      "average_weight:" {
        "unit": "kg",
        "male_olympians": 75.4,
        "female_olympians": 70.2
      }
      "average_age:" 26.2
    }
  }
```

* `GET api/v1/events` will return a list of sports and their associated events

```javascript
//Response Format
{
  "events":
    [
      {
        "sport": "Archery",
        "events": [
          "Archery Men's Individual",
          "Archery Men's Team",
          "Archery Women's Individual",
          "Archery Women's Team"
        ]
      },
      {
        "sport": "Badminton",
        "events": [
          "Badminton Men's Doubles",
          "Badminton Men's Singles",
          "Badminton Women's Doubles",
          "Badminton Women's Singles",
          "Badminton Mixed Doubles"
        ]
      },
      {...}
    ]
}
```

* `GET api/v1/events/:id/medalists` will return the medalists for a given event id

_This is sample data and it is incomplete. You may not have all medalists for a particular event._

```javascript
//Response Format
{
  "event": "Badminton Mixed Doubles",
  "medalists": [
      {
        "name": "Tontowi Ahmad",
        "team": "Indonesia-1",
        "age": 29,
        "medal": "Gold"
      },
      {
        "name": "Chan Peng Soon",
        "team": "Malaysia",
        "age": 28,
        "medal": "Silver"
      }
    ]
}
```

* `GET api/v1/sports/:id/competitors` will return all competitors for a given sport id in alphabetical order


```javascript
//Response Format
{
    "sport": "Basketball",
    "competitors": [
        "Abdul Wahab \"Alade\" Aminu",
        "Adriana \"Adrianinha\" Moiss Pinto",
        "Alejandro \"lex\" Abrines Redondo",
        "Aleksandra Crvendaki",
        "Amel Bouderra",
        "Ana Dabovi",
        "Andrew Michael Bogut",
        "Anna Cruz Lebrato",
        "Antoine Diot",
        "Aron John Baynes",
        "Aye Cora",
        "Bahar alar",
        "Bintou Dim",
        "Bogdan Bogdanovi",
        "Bojan Bogdanovi"
    ]
}
```


* `GET /api/v1/medal_count?country=United States` will return the medal count information for any country competing with a string parameter of the country


```javascript
//Response Format
{
    "country": "United States",
    "medals": {
        "gold": 42,
        "silver": 12,
        "bronze": 22
    },
    "total_medal_count": 76
}
```
* `GET /api/v1/top_ten_olympians` will return the top ten Olympians with the most medals from the Games

```javascript
//Response Format
{
    "top_ten_olympians": [
        {
            "name": "Simone Arianne Biles",
            "team": "United States",
            "age": 19,
            "sport": "Gymnastics",
            "total_medals_won": 5
        },
        {
            "name": "Madeline Jane \"Maya\" DiRado",
            "team": "United States",
            "age": 23,
            "sport": "Swimming",
            "total_medals_won": 4
        },
        {
            "name": "Nathan Ghar-Jun Adrian",
            "team": "United States",
            "age": 27,
            "sport": "Swimming",
            "total_medals_won": 4
        }
    ]
}
```
<h4>Testing</h4>

<p>After initial setup, you can start up the test suite in RSpec with the following commands</p>

  - run $ ``rails g rspec install`` to set up your test suite

<h4>Database Schema</h4>



* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
