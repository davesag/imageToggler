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
    strictEqual(this.elems.imageToggler(), this.elems, "should be chainable")

  asyncTest "clicking on an image sends quote to quote container", ->
    this.elems.imageToggler()
    link = this.elems.find("a").has("img").first()
    altLink = this.elems.find("a").has("img").last()
    equal link.length, 1, "expected there to be one link"
    link.on "click", (evt) =>
      evt.preventDefault()
      quoteContainer = this.elems.find ".staff-quote"
      equal quoteContainer.length, 1, "expected there to be one quoteContainer"
      equal quoteContainer.text(), "Something about staff 1", "expected the text to be injected properly"
      equal link.hasClass("imageToggler-bright"), true, "expected link to have class imageToggler-bright"
      equal altLink.hasClass("imageToggler-dim"), true, "expected other link to have class imageToggler-dim"
      equal link.hasClass("imageToggler-dim"), false, "expected link not to have class imageToggler-dim"
      equal altLink.hasClass("imageToggler-bright"), false, "expected other link not to have class imageToggler-bright"
      start()
    link.click()
    expect 7

) jQuery
