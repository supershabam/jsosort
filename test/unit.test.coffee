jsosort = require "../"
chai = require "chai"

chai.should()

describe "simple object", ->
  objA = {}
  objB = {}

  objA.value1 = "value1"
  objA.value2 = "value2"
  objB.value2 = "value2"
  objB.value1 = "value1"

  it "should be two equivalent objects", ->
    objA.should.deep.equal(objB)

  it "should not serialize the same", ->
    objAStr = JSON.stringify(objA)
    objBStr = JSON.stringify(objB)
    objAStr.should.not.equal(objBStr)

  it "should serialize the same after sorting", ->
    objASort = jsosort(objA);
    objBSort = jsosort(objB);
    objASortStr = JSON.stringify(objASort)
    objBSortStr = JSON.stringify(objBSort)

    objASort.should.deep.equal(objBSort)
    objASort.should.deep.equal(objA)
    objASortStr.should.equal(objBSortStr)

describe "deep object", ->
  objA = {}
  objB = {}

  objA.subobject = {}
  objA.subobject.value1 = "value1"
  objA.subobject.array1 = [1, 2, 3]
  objA.subobject.number1 = 1.2
  objA.nullvalue = null

  objB.nullvalue = null
  objB.subobject = {}
  objB.subobject.number1 = 1.2
  objB.subobject.array1 = [1, 2, 3]
  objB.subobject.value1 = "value1"

  it "should be two equivalent objects", ->
    objA.should.deep.equal(objB)

  it "should not serialize the same", ->
    objAStr = JSON.stringify(objA)
    objBStr = JSON.stringify(objB)
    objAStr.should.not.equal(objBStr)

  it "should serialize the same after sorting", ->
    objASort = jsosort(objA);
    objBSort = jsosort(objB);
    objASortStr = JSON.stringify(objASort)
    objBSortStr = JSON.stringify(objBSort)

    objASort.should.deep.equal(objBSort)
    objASort.should.deep.equal(objA)
    objASortStr.should.equal(objBSortStr)
