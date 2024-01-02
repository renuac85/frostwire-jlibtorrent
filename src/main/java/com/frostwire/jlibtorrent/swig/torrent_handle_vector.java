/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (https://www.swig.org).
 * Version 4.1.1
 *
 * Do not make changes to this file unless you know what you are doing - modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package com.frostwire.jlibtorrent.swig;

public class torrent_handle_vector extends java.util.AbstractList<torrent_handle> implements java.util.RandomAccess {
  private transient long swigCPtr;
  protected transient boolean swigCMemOwn;

  protected torrent_handle_vector(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(torrent_handle_vector obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected static long swigRelease(torrent_handle_vector obj) {
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
        libtorrent_jni.delete_torrent_handle_vector(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  public torrent_handle_vector(torrent_handle[] initialElements) {
    this();
    reserve(initialElements.length);

    for (torrent_handle element : initialElements) {
      add(element);
    }
  }

  public torrent_handle_vector(Iterable<torrent_handle> initialElements) {
    this();
    for (torrent_handle element : initialElements) {
      add(element);
    }
  }

  public torrent_handle get(int index) {
    return doGet(index);
  }

  public torrent_handle set(int index, torrent_handle e) {
    return doSet(index, e);
  }

  public boolean add(torrent_handle e) {
    modCount++;
    doAdd(e);
    return true;
  }

  public void add(int index, torrent_handle e) {
    modCount++;
    doAdd(index, e);
  }

  public torrent_handle remove(int index) {
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

  public torrent_handle_vector() {
    this(libtorrent_jni.new_torrent_handle_vector__SWIG_0(), true);
  }

  public torrent_handle_vector(torrent_handle_vector other) {
    this(libtorrent_jni.new_torrent_handle_vector__SWIG_1(torrent_handle_vector.getCPtr(other), other), true);
  }

  public long capacity() {
    return libtorrent_jni.torrent_handle_vector_capacity(swigCPtr, this);
  }

  public void reserve(long n) {
    libtorrent_jni.torrent_handle_vector_reserve(swigCPtr, this, n);
  }

  public boolean isEmpty() {
    return libtorrent_jni.torrent_handle_vector_isEmpty(swigCPtr, this);
  }

  public void clear() {
    libtorrent_jni.torrent_handle_vector_clear(swigCPtr, this);
  }

  public torrent_handle_vector(int count, torrent_handle value) {
    this(libtorrent_jni.new_torrent_handle_vector__SWIG_2(count, torrent_handle.getCPtr(value), value), true);
  }

  private int doSize() {
    return libtorrent_jni.torrent_handle_vector_doSize(swigCPtr, this);
  }

  private void doAdd(torrent_handle x) {
    libtorrent_jni.torrent_handle_vector_doAdd__SWIG_0(swigCPtr, this, torrent_handle.getCPtr(x), x);
  }

  private void doAdd(int index, torrent_handle x) {
    libtorrent_jni.torrent_handle_vector_doAdd__SWIG_1(swigCPtr, this, index, torrent_handle.getCPtr(x), x);
  }

  private torrent_handle doRemove(int index) {
    return new torrent_handle(libtorrent_jni.torrent_handle_vector_doRemove(swigCPtr, this, index), true);
  }

  private torrent_handle doGet(int index) {
    return new torrent_handle(libtorrent_jni.torrent_handle_vector_doGet(swigCPtr, this, index), false);
  }

  private torrent_handle doSet(int index, torrent_handle val) {
    return new torrent_handle(libtorrent_jni.torrent_handle_vector_doSet(swigCPtr, this, index, torrent_handle.getCPtr(val), val), true);
  }

  private void doRemoveRange(int fromIndex, int toIndex) {
    libtorrent_jni.torrent_handle_vector_doRemoveRange(swigCPtr, this, fromIndex, toIndex);
  }

}
