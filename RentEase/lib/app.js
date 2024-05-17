const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const app = express();
const router = express.Router();
const multer = require('multer'); //
const port = 3000; // Change this to your desired port

// Create a new SQLite database (or open an existing one)
const db = new sqlite3.Database('database.db');

// Create a table for users if it doesn't exist

app.use(express.json());

// Handle user registration
app.post('/insertdata', (req, res) => {
  const { fname, lname, email, pass, phone, address, profilepic } = req.body;


  // Insert user data into the database
  db.run(
    'INSERT INTO users (fname, lname, email, pass, phone, address, profilepic) VALUES (?, ?, ?, ?, ?, ?, ?)',
    [fname, lname, email, pass, phone, address, profilepic],
    (err) => {
      if (err) {
        console.error(err.message);
        res.status(500).json({ error: 'Failed to insert data' });
      } else {
        console.log('Data inserted successfully');
        res.status(200).json({ message: 'Registration successful' });
      }
    }
  );
});

app.post('/insertowner', (req, res) => {
  const { fname, lname, email, pass, phone, address, profilepic } = req.body;
    console.log(fname);

  // Insert user data into the database
  db.run(
    'INSERT INTO owner (fname, lname, email, pass, phone, address, profilepic) VALUES (?, ?, ?, ?, ?, ?, ?)',
    [fname, lname, email, pass, phone, address, profilepic],
    (err) => {
      if (err) {
        console.error(err.message);
        res.status(500).json({ error: 'Failed to insert data' });
      } else {
        console.log('Data inserted successfully');
        res.status(200).json({ message: 'Registration successful' });
      }
    }
  );
});

app.post('/insertcurrent', (req, res) => {
  const { email, pass,} = req.body;
console.log('hi')
  // Insert user data into the database
  db.run(
    'INSERT INTO current (email, pass) VALUES (?, ?)',
    [email, pass],
    (err) => {
      if (err) {
        console.error(err.message);
        res.status(500).json({ error: 'Failed to insert data' });
      } else {
        console.log('Data inserted successfully');
        res.status(200).json({ message: 'Registration successful' });
      }
    }
  );
});

app.post('/insertbooking', (req, res) => {
  const { owner,user_name,name,address,start,end,rent } = req.body;

  // Insert user data into the database
  db.run(
    'INSERT INTO booking (owner,user_name,name,address,start,end,rent) VALUES (?, ?, ?, ?, ?, ?,?)',
    [owner,user_name,name,address,start,end,rent],
    (err) => {
      if (err) {
        console.error(err.message);
        res.status(500).json({ error: 'Failed to insert data' });
      } else {
        console.log('Data inserted successfully');
        res.status(200).json({ message: 'Registration successful' });
      }
    }
  );
});


app.post('/insertfav', (req, res) => {
  const { user_name,name,address } = req.body;

  // Insert user data into the database
  db.run(
    'INSERT INTO fav (user_name,name,address) VALUES (?, ?, ?)',
    [user_name,name,address],
    (err) => {
      if (err) {
        console.error(err.message);
        res.status(500).json({ error: 'Failed to insert data' });
      } else {
        console.log('Data inserted successfully');
        res.status(200).json({ message: 'Registration successful' });
      }
    }
  );
});

app.delete('/deletefav', (req, res) => {
  const { user_name, name, address } = req.body;

  // Delete the property from the favorites table
  db.run(
    'DELETE FROM fav WHERE user_name = ? AND name = ? AND address = ?',
    [user_name, name, address],
    (err) => {
      if (err) {
        console.error(err.message);
        res.status(500).json({ error: 'Failed to delete data' });
      } else {
        console.log('Data deleted successfully');
        res.status(200).json({ message: 'Property removed from favorites' });
      }
    }
  );
});

app.delete('/deletehouse', (req, res) => {
  const { user_name, name, address } = req.body;

  // Delete the property from the favorites table
  db.run(
    'DELETE FROM house WHERE  name = ? AND address = ?',
    [name, address],
    (err) => {
      if (err) {
        console.error(err.message);
        res.status(500).json({ error: 'Failed to delete data' });
      } else {
        console.log('Data deleted successfully');
        res.status(200).json({ message: 'Property removed from favorites' });
      }
    }
  );
});

app.delete('/deletebooking', (req, res) => {
  const { user_name, name, address } = req.body;

  // Delete the property from the favorites table
  db.run(
    'DELETE FROM booking WHERE user_name = ? AND name = ? AND address = ?',
    [user_name, name, address],
    (err) => {
      if (err) {
        console.error(err.message);
        res.status(500).json({ error: 'Failed to delete data' });
      } else {
        console.log('Data deleted successfully');
        res.status(200).json({ message: 'Property removed from favorites' });
      }
    }
  );
});


app.delete('/deletecurrent', (req, res) => {
  const { user_name, name, address } = req.body;

  // Delete the property from the favorites table
  db.run(
    'DELETE FROM current WHERE email = ? AND pass = ? ',
    [user_name, name, address],
    (err) => {
      if (err) {
        console.error(err.message);
        res.status(500).json({ error: 'Failed to delete data' });
      } else {
        console.log('Data deleted successfully');
        res.status(200).json({ message: 'Property removed from favorites' });
      }
    }
  );
});


app.post('/inserthouse', (req, res) => {
  const { owner, name ,address ,city ,type ,bedroom ,bathroom ,area ,rent ,state ,description  ,security ,guest_limit,built_year,built_type } = req.body;

  // Insert user data into the database
  db.run(
    'INSERT INTO house (owner, name ,address ,city ,type ,bedroom ,bathroom ,area ,rent ,state ,description  ,security ,guest_limit,built_year,built_type ) VALUES (?, ?,?,?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?, ?)',
    [owner, name ,address ,city ,type ,bedroom ,bathroom ,area ,rent ,state ,description  ,security ,guest_limit ,built_year,built_type],
    (err) => {
      if (err) {
        console.error(err.message);
        res.status(500).json({ error: 'Failed to insert data' });
      } else {
        console.log('Data inserted successfully');
        res.status(200).json({ message: 'Registration successful' });
      }
    }
  );
});

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'uploads/'); // Set the destination folder for uploaded images
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname); // Use the original file name
  },
});

const upload = multer({ storage });

// Handle the image upload
app.post('/insertimage', upload.array('image', 10), (req, res) => {
  const { name, address } = req.body;

  // Get the file paths of the uploaded images
  const imagePaths = req.files.map((file) => file.path);

  // Insert user data and image paths into the database
  db.run(
    'INSERT INTO images (name, address, image1, image2, image3, image4, image5, image6, image7, image8, image9, image10) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
    [name, address, ...imagePaths],
    (err) => {
      if (err) {
        console.error(err.message);
        res.status(500).json({ error: 'Failed to insert data' });
      } else {
        console.log('Data inserted successfully');
        res.status(200).json({ message: 'Registration successful' });
      }
    }
  );
});


// Handle the image upload
app.post('/insertprofile', upload.single('image'), (req, res) => {
  const { name, address } = req.body;

  // Get the file path of the uploaded image
  const imagePath = req.file.path;

  // Insert user data and image path into the database
  db.run(
    'INSERT INTO profile (name, image) VALUES (?, ?)',
    [name, address, imagePath],
    (err) => {
      if (err) {
        console.error(err.message);
        res.status(500).json({ error: 'Failed to insert data' });
      } else {
        console.log('Data inserted successfully');
        res.status(200).json({ message: 'Registration successful' });
      }
    }
  );
});




app.get('/getuserdata', (req, res) => {
  // Query the database to retrieve user data
  db.all('SELECT * FROM users', (err, rows) => {
    if (err) {
      console.error(err.message);
      res.status(500).json({ error: 'Failed to retrieve data' });
    } else {
      console.log('Data retrieved successfully');
      res.status(200).json(rows);
    }
  });
});

app.get('/getbookingdata', (req, res) => {
  // Query the database to retrieve user data
  db.all('SELECT * FROM booking', (err, rows) => {
    if (err) {
      console.error(err.message);
      res.status(500).json({ error: 'Failed to retrieve data' });
    } else {
      console.log('Data retrieved successfully');
      res.status(200).json(rows);
    }
  });
});

app.get('/getownerdata', (req, res) => {
  // Query the database to retrieve user data
  db.all('SELECT * FROM owner', (err, rows) => {
    if (err) {
      console.error(err.message);
      res.status(500).json({ error: 'Failed to retrieve data' });
    } else {
      console.log('Data retrieved successfully');
      res.status(200).json(rows);
    }
  });
});

app.get('/getcurrentdata', (req, res) => {
  // Query the database to retrieve user data
  db.all('SELECT * FROM current', (err, rows) => {
    if (err) {
      console.error(err.message);
      res.status(500).json({ error: 'Failed to retrieve data' });
    } else {
      console.log('Data retrieved successfully');
      res.status(200).json(rows);
    }
  });
});


app.get('/gethousedata', (req, res) => {
console.log('by')
  // Query the database to retrieve user data
  db.all('SELECT * FROM house', (err, rows) => {
    if (err) {
      console.error(err.message);
      res.status(500).json({ error: 'Failed to retrieve data' });
    } else {
      console.log('Data retrieved successfully');
      res.status(200).json(rows);
    }
  });
});

app.get('/getloactiondata', (req, res) => {
console.log('by')
  // Query the database to retrieve user data
  db.all('SELECT city FROM house', (err, rows) => {
    if (err) {
      console.error(err.message);
      res.status(500).json({ error: 'Failed to retrieve data' });
    } else {
      console.log('Data retrieved successfully');
      res.status(200).json(rows);
    }
  });
});


app.get('/getfav', (req, res) => {
console.log('by')
  // Query the database to retrieve user data
  db.all('SELECT * FROM fav', (err, rows) => {
    if (err) {
      console.error(err.message);
      res.status(500).json({ error: 'Failed to retrieve data' });
    } else {
      console.log('Data retrieved successfully');
      res.status(200).json(rows);
    }
  });
});



/*
app.get('/getimagedata', (req, res) => {
console.log('hi');
  // Query the database to retrieve user data
  db.all('SELECT * FROM images', (err, rows) => {
    if (err) {
      console.error(err.message);
      res.status(500).json({ error: 'Failed to retrieve data' });
    } else {
      console.log('Data retrieved successfully');
      res.status(200).json(rows);
    }
  });
});
*/

app.get('/retrieveimages', (req, res) => {
  const { name, address } = req.query;

  // Query the database to retrieve image paths for the specified user
  db.all(
    'SELECT image1, image2, image3, image4, image5, image6, image7, image8, image9, image10 FROM images WHERE name = ? AND address = ?',
    [name, address],
    (err, rows) => {
      if (err) {
        console.error(err.message);
        res.status(500).json({ error: 'Failed to retrieve data' });
      } else {
        if (rows.length === 0) {
          res.status(404).json({ error: 'User not found' });
        } else {
          // Combine the image paths into an array
          const imagePaths = Object.values(rows[0]);

          // Filter out null or empty image paths
          const filteredImagePaths = imagePaths.filter((path) => path);

          // Send the image paths as a response
          res.status(200).json({ imagePaths: filteredImagePaths });
        }
      }
    }
  );
});




app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});

module.exports = router;
