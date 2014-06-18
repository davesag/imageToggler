(($) ->
  ###
    ======== A Handy Little QUnit Reference ========
    http://api.qunitjs.com/

    Test methods:
      module(name, {[setup][ ,teardown]})
      test(name, callback)
      expect(numberOfAssertions)
      stop(increment)
      start(decrement)
    Test assertions:
      ok(value, [message])
      equal(actual, expected, [message])
      notEqual(actual, expected, [message])
      deepEqual(actual, expected, [message])
      notDeepEqual(actual, expected, [message])
      strictEqual(actual, expected, [message])
      notStrictEqual(actual, expected, [message])
      throws(block, [expected], [message])
  ###

  module "basic tests",
  
    setup: ->
      this.elems = $("#qunit-fixture").children(".qunit-container")

  # all jQuery plugins must be chainable.
  test "is chainable", ->
    expect(1)
    strictEqual(this.elems.imageToggler(), this.elems, "should be chainable")

) jQuery
