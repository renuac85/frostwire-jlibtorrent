/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (https://www.swig.org).
 * Version 4.1.1
 *
 * Do not make changes to this file unless you know what you are doing - modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package com.frostwire.jlibtorrent.swig;

public class block_info {
  private transient long swigCPtr;
  protected transient boolean swigCMemOwn;

  protected block_info(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(block_info obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected static long swigRelease(block_info obj) {
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
        libtorrent_jni.delete_block_info(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  public tcp_endpoint peer() {
    return new tcp_endpoint(libtorrent_jni.block_info_peer(swigCPtr, this), true);
  }

  public void setBytes_progress(long value) {
    libtorrent_jni.block_info_bytes_progress_set(swigCPtr, this, value);
  }

  public long getBytes_progress() {
    return libtorrent_jni.block_info_bytes_progress_get(swigCPtr, this);
  }

  public void setBlock_size(long value) {
    libtorrent_jni.block_info_block_size_set(swigCPtr, this, value);
  }

  public long getBlock_size() {
    return libtorrent_jni.block_info_block_size_get(swigCPtr, this);
  }

  public void setState(long value) {
    libtorrent_jni.block_info_state_set(swigCPtr, this, value);
  }

  public long getState() {
    return libtorrent_jni.block_info_state_get(swigCPtr, this);
  }

  public void setNum_peers(long value) {
    libtorrent_jni.block_info_num_peers_set(swigCPtr, this, value);
  }

  public long getNum_peers() {
    return libtorrent_jni.block_info_num_peers_get(swigCPtr, this);
  }

  public block_info() {
    this(libtorrent_jni.new_block_info(), true);
  }

  public final static class block_state_t {
    public final static block_info.block_state_t none = new block_info.block_state_t("none");
    public final static block_info.block_state_t requested = new block_info.block_state_t("requested");
    public final static block_info.block_state_t writing = new block_info.block_state_t("writing");
    public final static block_info.block_state_t finished = new block_info.block_state_t("finished");

    public final int swigValue() {
      return swigValue;
    }

    public String toString() {
      return swigName;
    }

    public static block_state_t swigToEnum(int swigValue) {
      if (swigValue < swigValues.length && swigValue >= 0 && swigValues[swigValue].swigValue == swigValue)
        return swigValues[swigValue];
      for (int i = 0; i < swigValues.length; i++)
        if (swigValues[i].swigValue == swigValue)
          return swigValues[i];
      throw new IllegalArgumentException("No enum " + block_state_t.class + " with value " + swigValue);
    }

    private block_state_t(String swigName) {
      this.swigName = swigName;
      this.swigValue = swigNext++;
    }

    private block_state_t(String swigName, int swigValue) {
      this.swigName = swigName;
      this.swigValue = swigValue;
      swigNext = swigValue+1;
    }

    private block_state_t(String swigName, block_state_t swigEnum) {
      this.swigName = swigName;
      this.swigValue = swigEnum.swigValue;
      swigNext = this.swigValue+1;
    }

    private static block_state_t[] swigValues = { none, requested, writing, finished };
    private static int swigNext = 0;
    private final int swigValue;
    private final String swigName;
  }

}
