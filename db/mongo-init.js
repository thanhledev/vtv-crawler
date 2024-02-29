db = db.getSiblingDB("vtv_news_db_prod")

db.sample.insert([
  { name: 'Document 1'},
  { name: 'Document 2'},
  { name: 'Document 3'}
]);

db.createUser({
  user: 'admin',
  pwd: 'crawler',
  roles: [
    {
      role: 'dbOwner',
      db: 'vtv_news_db_prod'
    }
  ]
});
