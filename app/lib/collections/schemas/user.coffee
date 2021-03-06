schema = new SimpleSchema
  username:
    type: String
    label: 'Username'
    min: 3
    max: 32
  services:
    type: Object
    optional: true
    blackbox: true
  emails:
    type: [Object]
    label: 'Emails'
  'emails.$.address':
    regEx: SimpleSchema.RegEx.Email
    type: String
  'emails.$.verified':
    type: Boolean
    optional: true
    defaultValue: false
  profile:
    type: schemas.UserProfile
    label: 'Profile'
  createdAt:
    type: Date
    label: 'Created at'
    denyUpdate: true
    autoform:
      type: 'hidden'
    autoValue: () ->
      new Date() if @isInsert
  roles:
    type: [String]
    label: 'Roles'
    optional: true
    blackbox: true

Namespace 'schemas', User: schema
