use admin;

db.createUser({
  user: 'crawler',
  pwd: 'password',
  roles: [
    {
      role: 'root',
      db: 'admin'
    }
  ]
});
