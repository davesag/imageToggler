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
    img = this.elems.find(".staff-container a img").first()
    altImg = this.elems.find(".staff-container a img").last()
    equal img.length, 1, "expected there to be one image"
    img.on "click", (evt) =>
      evt.preventDefault()
      quoteContainer = this.elems.find ".staff-quote"
      equal quoteContainer.length, 1, "expected there to be one quoteContainer"
      equal quoteContainer.text(), "Something about staff 1", "expected the text to be injected properly"
      div = img.closest("div")
      altDiv = altImg.closest("div")
      equal div.hasClass("imageToggler-bright"), true, "expected div to have class imageToggler-bright"
      equal altDiv.hasClass("imageToggler-dim"), true, "expected altDiv to have class imageToggler-dim"
      equal div.hasClass("imageToggler-dim"), false, "expected div not to have class imageToggler-dim"
      equal altDiv.hasClass("imageToggler-bright"), false, "expected altDiv not to have class imageToggler-bright"
      start()
    img.click()
    expect 7

  module "hidey tests",

    setup: ->
      this.hideyElems = $("#qunit-fixture").children(".hiding")

  asyncTest "with hideOthers = true, hides siblings", ->
    this.hideyElems.imageToggler {hideOthers: true}
    img = this.hideyElems.find("a img").first()
    altImg = this.hideyElems.find("a img").last()
    quoteContainer1 = this.hideyElems.find ".staff-1"
    quoteContainer2 = this.hideyElems.find ".staff-2"
    equal quoteContainer1.length, 1, "expected to see current container"
    equal quoteContainer2.length, 1, "expected to see current container"
    equal quoteContainer1.is(":hidden"), true, "expected container to be hidden"
    equal quoteContainer2.is(":hidden"), true, "expected other container to be hidden"

    img.on "click", (evt) ->
      evt.preventDefault()
      equal quoteContainer1.is(":hidden"), false, "expected container not to be hidden"
      equal quoteContainer2.is(":hidden"), true, "expected other container to be hidden"
      start()
    img.click()
    expect 6

) jQuery
