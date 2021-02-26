import random

categories = {"drama": 5, "series": 4, "action": 6, "xxx": 8, "doc": 6, "cartoons" : 7}
directors = {"woody": "allen", "quentin": "tarantino", "tinto": "braas", "steven": "spielberg"
             , "lars": "von trier", "stanley": "kubrik"}
actors = {"arnold": "schwarznegger", "steve": "baldwin", "eva": "longoria", "mila": "yovovich"
             , "mike": "pare", "gina": "gerchon"}
titles = ["clockwork orange", "terminator", "dogville", "titanic", "xxx", "documentary"
              , "dogs", "cats", "cowboys"]

def fill_clients() :
    f_names = ["John", "Alex", "Lilly", "Serge", "Mary", "Kate"]
    l_names = ["Johns", "Alexer", "Lillyson", "Sergeman", "Marytrey", "Katepim"]
    email = "{0}@yahoo.com"
    insert = "\nINSERT INTO clients (first_name, last_name, email) \nvalues"
    values = "\n    ('{}', '{}', '{}'),"
    for i in range(0, 50):
        insert += (values.format(f_names[random.randint(0, 5)], l_names[random.randint(0, 5)], email.format(str(i))))
    return insert[:-1] + ';'


def fill_addresses() :
    countries = ["USA", "Canada"]
    cities = ["Boston", "Massachusetts", "Los Angeles", "California", "Denver", "Colorado"]
    provinces = ["NY", "QC", "ON", "GM", "MN"]
    street = ["johns", "pushkin", "marques", "sherbrooke", "5th avenue", "main"]
    buildings = [5511, 5587, 1584, 269, 489, 491, 79879, 4598]
    apts = [5511, 5587, 1584, 269, 489, 491, 79879, 4598]
    insert = "\nINSERT INTO addresses (country, province, city, street, building, apt, zipcode, client_id) \nvalues"
    values = "\n    ('{}', '{}', '{}', '{}', {}, {}, {}, {}),"

    for i in range(0, 50):
        insert += values.format(countries[random.randint(0, 1)], provinces[random.randint(0, 4)]
                                      , cities[random.randint(0, 5)], street[random.randint(0, 5)]
                                      , buildings[random.randint(0, 7)], apts[random.randint(0, 7)]
                                      , i+100000, i+1)
    return insert[:-1] + ';'


def fill_categories():

    insert = "\nINSERT INTO categories \nvalues"
    for k,v in categories.items():
        insert += f"\n     ('{k}', {v}),"
    return insert[:-1] + ';'


def fill_directors():

    insert = "\nINSERT INTO directors (d_last_name, d_first_name) \nvalues"
    for k, v in directors.items():
        insert += f"\n     ('{v}', '{k}'),"
    return insert[:-1] + ';'


def fill_actors():

    insert = "\nINSERT INTO actors (a_last_name, a_first_name) \nvalues"
    for k, v in actors.items():
        insert += f"\n     ('{v}', '{k}'),"
    return insert[:-1] + ';'


def fill_videos():

    years = [1981, 1982, 1983, 1984, 1991, 1997, 1998, 2010, 2001, 2018, 2007, 2008, 2009]
    insert = "\nINSERT INTO videos (title, year, categorie) \nvalues"
    values = "\n        ('{}', {}, '{}'),"
    for i in range(50):
        insert += values.format(titles[random.randint(0,8)], years[random.randint(0,12)]
                                 , random.choice(list(categories.keys())))
    return insert[:-1] + ';'


def fill_videos_actors():
    insert = "\nINSERT INTO videos_actors (video_id, actor_id) \nvalues"
    values = "\n        ({}, {}),"
    for i in range(1, 51):
        for n in range(0, i % 2 + 1):
            insert += values.format(i, random.randint(1, len(actors)))
    return insert[:-1] + ';'


def fill_videos_directors():
    insert = "\nINSERT INTO videos_directors (video_id, director_id) \nvalues"
    values = "\n        ({}, {}),"
    for i in range(1, 51):
        insert += values.format(i, random.randint(1, len(directors)))
    return insert[:-1] + ';'


def fill_orders():
    insert = "\nINSERT INTO orders (order_date, rent_duration, client_id, video_id) \nvalues"
    values = "\n        (NOW(), {}, {}, {}),"
    for i in range(100):
        insert += values.format(random.choice([1,3,7]), random.randint(1,50), random.randint(1, 50))
    return insert[:-1] + ';'


file = open('insert_stmnts.txt', 'w', encoding='utf-8')

file.write(fill_clients())
file.write(fill_addresses())
file.write(fill_categories())
file.write(fill_directors())
file.write(fill_actors())
file.write(fill_videos())
file.write(fill_videos_actors())
file.write(fill_videos_directors())
file.write(fill_orders())

file.close()






