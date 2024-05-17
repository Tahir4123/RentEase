const sqlite3 = require('sqlite3').verbose();

// Connect to the SQLite database (or create it if it doesn't exist)
const db = new sqlite3.Database('database.db');

// SQL query to create a table
const users = `
  CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT,
    password TEXT
  )
`;

const owner = `
  CREATE TABLE IF NOT EXISTS owner (
    id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT,
    password TEXT
  )
`;

const current = `
  CREATE TABLE IF NOT EXISTS current (
    id INTEGER PRIMARY KEY,
    email TEXT,
    pass TEXT
  )
`;


const images = `
      CREATE TABLE IF NOT EXISTS images (
        id INTEGER PRIMARY KEY,
        name TEXT,
        address TEXT,
        image1 BLOB,
        image2 BLOB,
        image3 BLOB,
        image4 BLOB,
        image5 BLOB,
        image6 BLOB,
        image7 BLOB,
        image8 BLOB,
        image9 BLOB,
        image10 BLOB
      )
`;

const fav = `
  CREATE TABLE IF NOT EXISTS fav (
    id INTEGER PRIMARY KEY,
    user_name TEXT,
    name TEXT,
    address TEXT
  )
`;

const booking = `
  CREATE TABLE IF NOT EXISTS booking (
    id INTEGER PRIMARY KEY,
    owner TEXT,
    user_name TEXT,
    name TEXT,
    address TEXT,
    start TEXT,
    end TEXT,
    rent TEXT
  )
`;

const profile = `
  CREATE TABLE IF NOT EXISTS profile (
    id INTEGER PRIMARY KEY,
    name TEXT,
    profile BLOB
  )
`;


// Execute the SQL query to create the table
db.run(users, (err) => {
  if (err) {
    console.error('Error creating table:', err.message);
  } else {
    console.log('Table created successfully');
  }

  // Close the database connection
  db.close((err) => {
    if (err) {
      console.error('Error closing the database:', err.message);
    } else {
      console.log('Database connection closed');
    }
  });
});

db.run(profile, (err) => {
  if (err) {
    console.error('Error creating table:', err.message);
  } else {
    console.log('Table created successfully');
  }

  // Close the database connection
  db.close((err) => {
    if (err) {
      console.error('Error closing the database:', err.message);
    } else {
      console.log('Database connection closed');
    }
  });
});


db.run(owner, (err) => {
  if (err) {
    console.error('Error creating table:', err.message);
  } else {
    console.log('Table created successfully');
  }

  // Close the database connection
  db.close((err) => {
    if (err) {
      console.error('Error closing the database:', err.message);
    } else {
      console.log('Database connection closed');
    }
  });
});

db.run(current, (err) => {
  if (err) {
    console.error('Error creating table:', err.message);
  } else {
    console.log('Table owner created successfully');
  }

  // Close the database connection
  db.close((err) => {
    if (err) {
      console.error('Error closing the database:', err.message);
    } else {
      console.log('Database connection closed');
    }
  });
});


db.serialize(() => {
  db.run(`
    CREATE TABLE IF NOT EXISTS house (
      id INTEGER PRIMARY KEY,
      owner TEXT,
      name TEXT,
      address TEXT,
      city TEXT,
      type TEXT,
      bedroom TEXT,
      bathroom TEXT,
      area TEXT,
      rent TEXT,
      state TEXT,
      description TEXT,
      security TEXT,
      built_type TEXT,
      built_year TEXT,
      guest_limit TEXT
    )
  `, (err) => {
    if (err) {
      console.error('Error creating table:', err.message);
    } else {
      console.log('Table "house" created successfully');
    }
  });
});

db.run(images, (err) => {
  if (err) {
    console.error('Error creating table:', err.message);
  } else {
    console.log('Table created successfully');
  }

  // Close the database connection
  db.close((err) => {
    if (err) {
      console.error('Error closing the database:', err.message);
    } else {
      console.log('Database connection closed');
    }
  });
});

db.run(fav, (err) => {
  if (err) {
    console.error('Error creating table:', err.message);
  } else {
    console.log('Table created successfully');
  }

  // Close the database connection
  db.close((err) => {
    if (err) {
      console.error('Error closing the database:', err.message);
    } else {
      console.log('Database connection closed');
    }
  });
});

db.run(booking, (err) => {
  if (err) {
    console.error('Error creating table:', err.message);
  } else {
    console.log('Table created successfully');
  }

  // Close the database connection
  db.close((err) => {
    if (err) {
      console.error('Error closing the database:', err.message);
    } else {
      console.log('Database connection closed');
    }
  });
});

