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

  # # all jQuery plugins must be chainable.
  # test "is chainable", ->
  #   strictEqual(this.elems.imageToggler(), this.elems, "should be chainable")

  asyncTest "clicking on an image sends quote to quote container", ->
    this.elems.imageToggler()
    img = this.elems.find("a img").first()
    altImg = this.elems.find("a img").last()
    equal img.length, 1, "expected there to be one image"
    img.on "click", (evt) =>
      evt.preventDefault()
      quoteContainer = this.elems.find ".staff-quote"
      equal quoteContainer.length, 1, "expected there to be one quoteContainer"
      equal quoteContainer.text(), "Something about staff 1", "expected the text to be injected properly"
      equal img.hasClass("imageToggler-bright"), true, "expected img to have class imageToggler-bright"
      equal altImg.hasClass("imageToggler-dim"), true, "expected other img to have class imageToggler-dim"
      equal img.hasClass("imageToggler-dim"), false, "expected img not to have class imageToggler-dim"
      equal altImg.hasClass("imageToggler-bright"), false, "expected other img not to have class imageToggler-bright"
      start()
    img.click()
    expect 7

) jQuery
