/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (https://www.swig.org).
 * Version 4.1.1
 *
 * Do not make changes to this file unless you know what you are doing - modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package com.frostwire.jlibtorrent.swig;

public class session_params {
  private transient long swigCPtr;
  protected transient boolean swigCMemOwn;

  protected session_params(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(session_params obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected static long swigRelease(session_params obj) {
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
        libtorrent_jni.delete_session_params(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  public session_params(settings_pack sp) {
    this(libtorrent_jni.new_session_params__SWIG_0(settings_pack.getCPtr(sp), sp), true);
  }

  public session_params() {
    this(libtorrent_jni.new_session_params__SWIG_1(), true);
  }

  public session_params(session_params arg0) {
    this(libtorrent_jni.new_session_params__SWIG_2(session_params.getCPtr(arg0), arg0), true);
  }

  public void setSettings(settings_pack value) {
    libtorrent_jni.session_params_settings_set(swigCPtr, this, settings_pack.getCPtr(value), value);
  }

  public settings_pack getSettings() {
    long cPtr = libtorrent_jni.session_params_settings_get(swigCPtr, this);
    return (cPtr == 0) ? null : new settings_pack(cPtr, false);
  }

  public void setDht_state(SWIGTYPE_p_dht__dht_state value) {
    libtorrent_jni.session_params_dht_state_set(swigCPtr, this, SWIGTYPE_p_dht__dht_state.getCPtr(value));
  }

  public SWIGTYPE_p_dht__dht_state getDht_state() {
    return new SWIGTYPE_p_dht__dht_state(libtorrent_jni.session_params_dht_state_get(swigCPtr, this), true);
  }

  public void setExt_state(SWIGTYPE_p_std__mapT_std__string_std__string_std__lessT_std__string_t_t value) {
    libtorrent_jni.session_params_ext_state_set(swigCPtr, this, SWIGTYPE_p_std__mapT_std__string_std__string_std__lessT_std__string_t_t.getCPtr(value));
  }

  public SWIGTYPE_p_std__mapT_std__string_std__string_std__lessT_std__string_t_t getExt_state() {
    long cPtr = libtorrent_jni.session_params_ext_state_get(swigCPtr, this);
    return (cPtr == 0) ? null : new SWIGTYPE_p_std__mapT_std__string_std__string_std__lessT_std__string_t_t(cPtr, false);
  }

  public void setIp_filter(ip_filter value) {
    libtorrent_jni.session_params_ip_filter_set(swigCPtr, this, ip_filter.getCPtr(value), value);
  }

  public ip_filter getIp_filter() {
    long cPtr = libtorrent_jni.session_params_ip_filter_get(swigCPtr, this);
    return (cPtr == 0) ? null : new ip_filter(cPtr, false);
  }

  public static session_params read_session_params(bdecode_node e, SWIGTYPE_p_libtorrent__save_state_flags_t flags) {
    return new session_params(libtorrent_jni.session_params_read_session_params__SWIG_0(bdecode_node.getCPtr(e), e, SWIGTYPE_p_libtorrent__save_state_flags_t.getCPtr(flags)), true);
  }

  public static session_params read_session_params(bdecode_node e) {
    return new session_params(libtorrent_jni.session_params_read_session_params__SWIG_1(bdecode_node.getCPtr(e), e), true);
  }

  public static entry write_session_params(session_params sp, SWIGTYPE_p_libtorrent__save_state_flags_t flags) {
    return new entry(libtorrent_jni.session_params_write_session_params__SWIG_0(session_params.getCPtr(sp), sp, SWIGTYPE_p_libtorrent__save_state_flags_t.getCPtr(flags)), true);
  }

  public static entry write_session_params(session_params sp) {
    return new entry(libtorrent_jni.session_params_write_session_params__SWIG_1(session_params.getCPtr(sp), sp), true);
  }

  public static byte_vector write_session_params_buf(session_params sp, SWIGTYPE_p_libtorrent__save_state_flags_t flags) {
    return new byte_vector(libtorrent_jni.session_params_write_session_params_buf__SWIG_0(session_params.getCPtr(sp), sp, SWIGTYPE_p_libtorrent__save_state_flags_t.getCPtr(flags)), true);
  }

  public static byte_vector write_session_params_buf(session_params sp) {
    return new byte_vector(libtorrent_jni.session_params_write_session_params_buf__SWIG_1(session_params.getCPtr(sp), sp), true);
  }

  public void set_posix_disk_io_constructor() {
    libtorrent_jni.session_params_set_posix_disk_io_constructor(swigCPtr, this);
  }

  public void set_default_disk_io_constructor() {
    libtorrent_jni.session_params_set_default_disk_io_constructor(swigCPtr, this);
  }

}
