/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (https://www.swig.org).
 * Version 4.1.1
 *
 * Do not make changes to this file unless you know what you are doing - modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package com.frostwire.jlibtorrent.swig;

public class bitfield_vector extends java.util.AbstractList<SWIGTYPE_p_libtorrent__bitfield> implements java.util.RandomAccess {
  private transient long swigCPtr;
  protected transient boolean swigCMemOwn;

  protected bitfield_vector(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(bitfield_vector obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected static long swigRelease(bitfield_vector obj) {
    long ptr = 0;
    if (obj != null) {
      if (!obj.swigCMemOwn)
        throw new RuntimeException("Cannot release ownership as memory is not owned");
      ptr = obj.swigCPtr;
      obj.swigCMemOwn = false;
      obj.delete();
    }
    return ptr;
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        libtorrent_jni.delete_bitfield_vector(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  public bitfield_vector(SWIGTYPE_p_libtorrent__bitfield[] initialElements) {
    this();
    reserve(initialElements.length);

    for (SWIGTYPE_p_libtorrent__bitfield element : initialElements) {
      add(element);
    }
  }

  public bitfield_vector(Iterable<SWIGTYPE_p_libtorrent__bitfield> initialElements) {
    this();
    for (SWIGTYPE_p_libtorrent__bitfield element : initialElements) {
      add(element);
    }
  }

  public SWIGTYPE_p_libtorrent__bitfield get(int index) {
    return doGet(index);
  }

  public SWIGTYPE_p_libtorrent__bitfield set(int index, SWIGTYPE_p_libtorrent__bitfield e) {
    return doSet(index, e);
  }

  public boolean add(SWIGTYPE_p_libtorrent__bitfield e) {
    modCount++;
    doAdd(e);
    return true;
  }

  public void add(int index, SWIGTYPE_p_libtorrent__bitfield e) {
    modCount++;
    doAdd(index, e);
  }

  public SWIGTYPE_p_libtorrent__bitfield remove(int index) {
    modCount++;
    return doRemove(index);
  }

  protected void removeRange(int fromIndex, int toIndex) {
    modCount++;
    doRemoveRange(fromIndex, toIndex);
  }

  public int size() {
    return doSize();
  }

  public bitfield_vector() {
    this(libtorrent_jni.new_bitfield_vector__SWIG_0(), true);
  }

  public bitfield_vector(bitfield_vector other) {
    this(libtorrent_jni.new_bitfield_vector__SWIG_1(bitfield_vector.getCPtr(other), other), true);
  }

  public long capacity() {
    return libtorrent_jni.bitfield_vector_capacity(swigCPtr, this);
  }

  public void reserve(long n) {
    libtorrent_jni.bitfield_vector_reserve(swigCPtr, this, n);
  }

  public boolean isEmpty() {
    return libtorrent_jni.bitfield_vector_isEmpty(swigCPtr, this);
  }

  public void clear() {
    libtorrent_jni.bitfield_vector_clear(swigCPtr, this);
  }

  public bitfield_vector(int count, SWIGTYPE_p_libtorrent__bitfield value) {
    this(libtorrent_jni.new_bitfield_vector__SWIG_2(count, SWIGTYPE_p_libtorrent__bitfield.getCPtr(value)), true);
  }

  private int doSize() {
    return libtorrent_jni.bitfield_vector_doSize(swigCPtr, this);
  }

  private void doAdd(SWIGTYPE_p_libtorrent__bitfield x) {
    libtorrent_jni.bitfield_vector_doAdd__SWIG_0(swigCPtr, this, SWIGTYPE_p_libtorrent__bitfield.getCPtr(x));
  }

  private void doAdd(int index, SWIGTYPE_p_libtorrent__bitfield x) {
    libtorrent_jni.bitfield_vector_doAdd__SWIG_1(swigCPtr, this, index, SWIGTYPE_p_libtorrent__bitfield.getCPtr(x));
  }

  private SWIGTYPE_p_libtorrent__bitfield doRemove(int index) {
    return new SWIGTYPE_p_libtorrent__bitfield(libtorrent_jni.bitfield_vector_doRemove(swigCPtr, this, index), true);
  }

  private SWIGTYPE_p_libtorrent__bitfield doGet(int index) {
    return new SWIGTYPE_p_libtorrent__bitfield(libtorrent_jni.bitfield_vector_doGet(swigCPtr, this, index), false);
  }

  private SWIGTYPE_p_libtorrent__bitfield doSet(int index, SWIGTYPE_p_libtorrent__bitfield val) {
    return new SWIGTYPE_p_libtorrent__bitfield(libtorrent_jni.bitfield_vector_doSet(swigCPtr, this, index, SWIGTYPE_p_libtorrent__bitfield.getCPtr(val)), true);
  }

  private void doRemoveRange(int fromIndex, int toIndex) {
    libtorrent_jni.bitfield_vector_doRemoveRange(swigCPtr, this, fromIndex, toIndex);
  }

}
