/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (https://www.swig.org).
 * Version 4.1.1
 *
 * Do not make changes to this file unless you know what you are doing - modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package com.frostwire.jlibtorrent.swig;

public class announce_infohash {
  private transient long swigCPtr;
  protected transient boolean swigCMemOwn;

  protected announce_infohash(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(announce_infohash obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected static long swigRelease(announce_infohash obj) {
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
        libtorrent_jni.delete_announce_infohash(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  public void setMessage(String value) {
    libtorrent_jni.announce_infohash_message_set(swigCPtr, this, value);
  }

  public String getMessage() {
    return libtorrent_jni.announce_infohash_message_get(swigCPtr, this);
  }

  public void setLast_error(error_code value) {
    libtorrent_jni.announce_infohash_last_error_set(swigCPtr, this, error_code.getCPtr(value), value);
  }

  public error_code getLast_error() {
    long cPtr = libtorrent_jni.announce_infohash_last_error_get(swigCPtr, this);
    return (cPtr == 0) ? null : new error_code(cPtr, false);
  }

  public void setScrape_incomplete(int value) {
    libtorrent_jni.announce_infohash_scrape_incomplete_set(swigCPtr, this, value);
  }

  public int getScrape_incomplete() {
    return libtorrent_jni.announce_infohash_scrape_incomplete_get(swigCPtr, this);
  }

  public void setScrape_complete(int value) {
    libtorrent_jni.announce_infohash_scrape_complete_set(swigCPtr, this, value);
  }

  public int getScrape_complete() {
    return libtorrent_jni.announce_infohash_scrape_complete_get(swigCPtr, this);
  }

  public void setScrape_downloaded(int value) {
    libtorrent_jni.announce_infohash_scrape_downloaded_set(swigCPtr, this, value);
  }

  public int getScrape_downloaded() {
    return libtorrent_jni.announce_infohash_scrape_downloaded_get(swigCPtr, this);
  }

  public void setFails(short value) {
    libtorrent_jni.announce_infohash_fails_set(swigCPtr, this, value);
  }

  public short getFails() {
    return libtorrent_jni.announce_infohash_fails_get(swigCPtr, this);
  }

  public void setUpdating(boolean value) {
    libtorrent_jni.announce_infohash_updating_set(swigCPtr, this, value);
  }

  public boolean getUpdating() {
    return libtorrent_jni.announce_infohash_updating_get(swigCPtr, this);
  }

  public void setStart_sent(boolean value) {
    libtorrent_jni.announce_infohash_start_sent_set(swigCPtr, this, value);
  }

  public boolean getStart_sent() {
    return libtorrent_jni.announce_infohash_start_sent_get(swigCPtr, this);
  }

  public void setComplete_sent(boolean value) {
    libtorrent_jni.announce_infohash_complete_sent_set(swigCPtr, this, value);
  }

  public boolean getComplete_sent() {
    return libtorrent_jni.announce_infohash_complete_sent_get(swigCPtr, this);
  }

  public void setTriggered_manually(boolean value) {
    libtorrent_jni.announce_infohash_triggered_manually_set(swigCPtr, this, value);
  }

  public boolean getTriggered_manually() {
    return libtorrent_jni.announce_infohash_triggered_manually_get(swigCPtr, this);
  }

  public long get_next_announce() {
    return libtorrent_jni.announce_infohash_get_next_announce(swigCPtr, this);
  }

  public long get_min_announce() {
    return libtorrent_jni.announce_infohash_get_min_announce(swigCPtr, this);
  }

}
