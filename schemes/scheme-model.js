const db = require('../data/dbConfig.js');

module.exports = {
find,
findById,
findSteps,
 add,
 update,
remove

}

function find() {
    return db('schemes')
}

function findById(id) {
    return db('schemes').where({id}).first();
}

function findSteps(id) {
    return db('steps').join("schemes", "schemes.id", "=", "scheme_id")
    .select("schemes.id", "scheme_name", "step_number", "instructions")
    .where({'scheme_id' : id})
    .orderBy('step_number')
}

function add(scheme) {
    return db('schemes').insert(scheme, 'id')

}

function update(id, changes){
    return db('schemes')
        .where({ id })
        .update(changes)
}

function remove(id) {
    return db('schemes').where({ id }).del()
}