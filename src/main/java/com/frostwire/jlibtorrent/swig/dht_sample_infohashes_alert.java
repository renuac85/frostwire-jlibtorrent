/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (https://www.swig.org).
 * Version 4.1.1
 *
 * Do not make changes to this file unless you know what you are doing - modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package com.frostwire.jlibtorrent.swig;

public class dht_sample_infohashes_alert extends alert {
  private transient long swigCPtr;

  protected dht_sample_infohashes_alert(long cPtr, boolean cMemoryOwn) {
    super(libtorrent_jni.dht_sample_infohashes_alert_SWIGUpcast(cPtr), cMemoryOwn);
    swigCPtr = cPtr;
  }

  protected static long getCPtr(dht_sample_infohashes_alert obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected static long swigRelease(dht_sample_infohashes_alert obj) {
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
        libtorrent_jni.delete_dht_sample_infohashes_alert(swigCPtr);
      }
      swigCPtr = 0;
    }
    super.delete();
  }

  public int type() {
    return libtorrent_jni.dht_sample_infohashes_alert_type(swigCPtr, this);
  }

  public alert_category_t category() {
    return new alert_category_t(libtorrent_jni.dht_sample_infohashes_alert_category(swigCPtr, this), true);
  }

  public String what() {
    return libtorrent_jni.dht_sample_infohashes_alert_what(swigCPtr, this);
  }

  public String message() {
    return libtorrent_jni.dht_sample_infohashes_alert_message(swigCPtr, this);
  }

  public void setNode_id(SWIGTYPE_p_sha1_hash value) {
    libtorrent_jni.dht_sample_infohashes_alert_node_id_set(swigCPtr, this, SWIGTYPE_p_sha1_hash.getCPtr(value));
  }

  public SWIGTYPE_p_sha1_hash getNode_id() {
    return new SWIGTYPE_p_sha1_hash(libtorrent_jni.dht_sample_infohashes_alert_node_id_get(swigCPtr, this), true);
  }

  public int getNum_infohashes() {
    return libtorrent_jni.dht_sample_infohashes_alert_num_infohashes_get(swigCPtr, this);
  }

  public int num_samples() {
    return libtorrent_jni.dht_sample_infohashes_alert_num_samples(swigCPtr, this);
  }

  public SWIGTYPE_p_std__vectorT_sha1_hash_t samples() {
    return new SWIGTYPE_p_std__vectorT_sha1_hash_t(libtorrent_jni.dht_sample_infohashes_alert_samples(swigCPtr, this), true);
  }

  public int num_nodes() {
    return libtorrent_jni.dht_sample_infohashes_alert_num_nodes(swigCPtr, this);
  }

  public SWIGTYPE_p_std__vectorT_std__pairT_sha1_hash_libtorrent__udp__endpoint_t_t nodes() {
    return new SWIGTYPE_p_std__vectorT_std__pairT_sha1_hash_libtorrent__udp__endpoint_t_t(libtorrent_jni.dht_sample_infohashes_alert_nodes(swigCPtr, this), true);
  }

  public udp_endpoint get_endpoint() {
    return new udp_endpoint(libtorrent_jni.dht_sample_infohashes_alert_get_endpoint(swigCPtr, this), true);
  }

  public long get_interval() {
    return libtorrent_jni.dht_sample_infohashes_alert_get_interval(swigCPtr, this);
  }

  public final static alert_category_t static_category = new alert_category_t(libtorrent_jni.dht_sample_infohashes_alert_static_category_get(), false);
  public final static alert_priority priority = alert_priority.swigToEnum(libtorrent_jni.dht_sample_infohashes_alert_priority_get());
  public final static int alert_type = libtorrent_jni.dht_sample_infohashes_alert_alert_type_get();
}
