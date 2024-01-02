/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (https://www.swig.org).
 * Version 4.1.1
 *
 * Do not make changes to this file unless you know what you are doing - modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package com.frostwire.jlibtorrent.swig;

public class dht_put_alert extends alert {
  private transient long swigCPtr;

  protected dht_put_alert(long cPtr, boolean cMemoryOwn) {
    super(libtorrent_jni.dht_put_alert_SWIGUpcast(cPtr), cMemoryOwn);
    swigCPtr = cPtr;
  }

  protected static long getCPtr(dht_put_alert obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected static long swigRelease(dht_put_alert obj) {
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
        libtorrent_jni.delete_dht_put_alert(swigCPtr);
      }
      swigCPtr = 0;
    }
    super.delete();
  }

  public int type() {
    return libtorrent_jni.dht_put_alert_type(swigCPtr, this);
  }

  public alert_category_t category() {
    return new alert_category_t(libtorrent_jni.dht_put_alert_category(swigCPtr, this), true);
  }

  public String what() {
    return libtorrent_jni.dht_put_alert_what(swigCPtr, this);
  }

  public String message() {
    return libtorrent_jni.dht_put_alert_message(swigCPtr, this);
  }

  public void setTarget(SWIGTYPE_p_sha1_hash value) {
    libtorrent_jni.dht_put_alert_target_set(swigCPtr, this, SWIGTYPE_p_sha1_hash.getCPtr(value));
  }

  public SWIGTYPE_p_sha1_hash getTarget() {
    return new SWIGTYPE_p_sha1_hash(libtorrent_jni.dht_put_alert_target_get(swigCPtr, this), true);
  }

  public void setNum_success(int value) {
    libtorrent_jni.dht_put_alert_num_success_set(swigCPtr, this, value);
  }

  public int getNum_success() {
    return libtorrent_jni.dht_put_alert_num_success_get(swigCPtr, this);
  }

  public SWIGTYPE_p_std__arrayT_signed_char_32_t get_public_key() {
    return new SWIGTYPE_p_std__arrayT_signed_char_32_t(libtorrent_jni.dht_put_alert_get_public_key(swigCPtr, this), true);
  }

  public SWIGTYPE_p_std__arrayT_signed_char_64_t get_signature() {
    return new SWIGTYPE_p_std__arrayT_signed_char_64_t(libtorrent_jni.dht_put_alert_get_signature(swigCPtr, this), true);
  }

  public byte_vector get_salt() {
    return new byte_vector(libtorrent_jni.dht_put_alert_get_salt(swigCPtr, this), true);
  }

  public long get_seq() {
    return libtorrent_jni.dht_put_alert_get_seq(swigCPtr, this);
  }

  public final static alert_priority priority = alert_priority.swigToEnum(libtorrent_jni.dht_put_alert_priority_get());
  public final static int alert_type = libtorrent_jni.dht_put_alert_alert_type_get();
  public final static alert_category_t static_category = new alert_category_t(libtorrent_jni.dht_put_alert_static_category_get(), false);
}
