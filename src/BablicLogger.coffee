class BablicLogger
  constructor: (@component) ->
    return


module.exports = (component) ->
  func = (object, args...) ->
    if typeof(object) isnt 'object' or object is null
      object += ' ' + args.join ' '
      object = {message: object}
    func.info object

  func.log = ({user_id, site_id, message, data}) ->
    object = arguments[0]
    object.component = component
    try
      console.log JSON.stringify(object)
    catch e
      console.log object

  func.info = ({user_id, site_id, message, data}) ->
    object = arguments[0]
    object.log_level = 'info'
    this.log object

  func.warn =  ({user_id, site_id, message, data}) ->
    object = arguments[0]
    object.log_level = 'warn'
    object.caller = arguments.callee.caller.toString()
    this.log object

  func.error = ({user_id, site_id, message, data}) ->
    object = arguments[0]
    object.log_level = 'error'
    object.trace = new Error().stack
    this.log object

  return func
