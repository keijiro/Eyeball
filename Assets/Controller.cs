using UnityEngine;

namespace Eyeball
{
    sealed class Controller : MonoBehaviour
    {
        float _gazing;

        void Update()
        {
            var delta = Input.GetKey(KeyCode.Space) ? 2.0f : -1.0f;
            delta *= Time.deltaTime;

            _gazing = Mathf.Clamp01(_gazing + delta);

            var vfx = GetComponent<UnityEngine.VFX.VisualEffect>();
            vfx.SetFloat("Gaze", _gazing);
        }
    }
}
