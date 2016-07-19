bablic_logger = require('./bablicLogger')('erez');

bablic_logger({user_id: 1, site_id: 2, data:'info'})
bablic_logger.error('ERROR')
bablic_logger.warn('warning')

console.log(bablic_logger)
