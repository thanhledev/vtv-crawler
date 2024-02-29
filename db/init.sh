set -e
mongosh <<EOF
use $MONGODB_DB
db.createUser({
  user: '$MONGODB_USER',
  pwd:  '$MONGODB_PASSWORD',
  roles: [{
    role: 'dbOwner',
    db: '$MONGODB_DB'
  }]
})
EOF
