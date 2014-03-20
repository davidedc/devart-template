// adapted from http://stackoverflow.com/a/5144761/1318347

public class IntBox {
    public IntBox() {
    }
    public IntBox(int startValue) {
        this.value = startValue;
    }
    public IntBox(IntBox intBox) {
        this.value = intBox.value;
    }
    public int value;
}
